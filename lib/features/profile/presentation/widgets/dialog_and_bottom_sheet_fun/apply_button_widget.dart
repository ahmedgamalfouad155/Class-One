import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/constants/constants.dart';
import 'package:sinna/core/cubit/radio_cubit/radio_cubit.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/auth/data/models/user_academic_model.dart';
import 'package:sinna/features/profile/presentation/manager/academic_info_update/academic_info_update_cubit.dart';
import 'package:sinna/features/profile/presentation/manager/levels_radio_cubit.dart';
import 'package:sinna/features/profile/presentation/manager/program_filter_cubit.dart';
import 'package:sinna/features/profile/presentation/manager/specialization_filter_cubit.dart';

class ApplyButtonWidget extends StatelessWidget {
  const ApplyButtonWidget({
    super.key,
    required this.specializationCubit,
    required this.programCubit,
    required this.universityCubit,
    required this.levelsCubit,
  });

  final SpecializationFilterCubit specializationCubit;
  final ProgramFilterCubit programCubit;
  final RadioCubit universityCubit;
  final LevelsRadioCubit levelsCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AcademicInfoUpdateCubit, AcademicInfoUpdateState>(
      bloc: context.read<AcademicInfoUpdateCubit>(),
      builder: (context, state) {
        if (state is AcademicInfoUpdateLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is AcademicInfoUpdateSuccessState ||
            state is AcademicInfoUpdateInitial) {
          return CustomButton(
            text: "Apply",
            onPressed: () {
              final specializationIndex = specializationCubit.state;
              final programIndex = programCubit.state;
              final universitySelected = universityCubit.state;
              final levelSelected = levelsCubit.state; 
              final userAcademicModel = UserAcademicModel(
                specialization:
                    specializationBottomSheetFilters[specializationIndex],
                program: programBottomSheetFilters[programIndex],
                university: universitySelected,
                level: levelSelected,
              );
              context.read<AcademicInfoUpdateCubit>().updateAcademicInfo(
                userAcademicModel,
              );
            },
          );
        }

        if (state is AcademicInfoUpdateFailureState) {
          return Text(state.errMessage);
        }

        return const Text("error");
      },
    );
  }
}
