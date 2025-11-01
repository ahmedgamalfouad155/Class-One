import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/cubit/radio_cubit/radio_cubit.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/features/profile/presentation/manager/academic_info_update/academic_info_update_cubit.dart';
import 'package:sinna/features/profile/presentation/manager/levels_radio_cubit.dart';
import 'package:sinna/features/profile/presentation/manager/program_filter_cubit.dart';
import 'package:sinna/features/profile/presentation/manager/specialization_filter_cubit.dart';
import 'package:sinna/features/profile/presentation/widgets/institutions_info_widget.dart';
import 'package:sinna/features/profile/presentation/widgets/program_filter_bottom_sheet_widget.dart';
import 'package:sinna/features/profile/presentation/widgets/specilalization_filter_bottom_sheet_widget.dart';
import 'package:sinna/features/profile/presentation/widgets/levels_widget.dart';

class SetupContentWidget extends StatelessWidget {
  const SetupContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => SpecializationFilterCubit()),
          BlocProvider(create: (_) => ProgramFilterCubit()),
          BlocProvider(create: (_) => RadioCubit()),
          BlocProvider(create: (_) => LevelsRadioCubit()),
          BlocProvider(create: (_) => AcademicInfoUpdateCubit()),
        ],
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: context.height * .97),
          child: Builder(
            builder: (context) {
              final specializationCubit = context
                  .read<SpecializationFilterCubit>();
              final programCubit = BlocProvider.of<ProgramFilterCubit>(context);
              final universityCubit = BlocProvider.of<RadioCubit>(context);
              final levelsCubit = BlocProvider.of<LevelsRadioCubit>(context);

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BlocProvider.value(
                    value: specializationCubit,
                    child: const SpecializationFilterBottomSheetWidget(),
                  ),
                  BlocProvider.value(
                    value: programCubit,
                    child: const ProgramFilterBottomSheetWidget(),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: CustomsBoxDecoration().profileDecoration(
                      context,
                    ),
                    child: Column(
                      children: [
                        BlocProvider.value(
                          value: universityCubit,
                          child: const InstitutionsInfoWidget(),
                        ),
                        CustomDividerWidget(isHeight: true),
                        BlocProvider.value(
                          value: levelsCubit,
                          child: const LevelsWidget(),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  CustomButton(
                    text: "Next",
                    onPressed: () {
                      // final specialization =
                      //     specializationBottomSheetFilters[specializationCubit
                      //         .state];
                      // final program =
                      //     programBottomSheetFilters[programCubit.state];
                      // final university = universityCubit.state;
                      // final level = levelsCubit.state;

                      // // context.read<CreateCourseCubit>().setSetupData(
                      // //   specialization: specialization,
                      // //   program: program,
                      // //   university: university.toString(),
                      // //   level: level.toString(),
                      // // );
                      // if (university != null && level != null) {
                      //   print(specialization);
                      //   print(program);
                      //   // print(university);
                      //   // print(level);
                      // }
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
