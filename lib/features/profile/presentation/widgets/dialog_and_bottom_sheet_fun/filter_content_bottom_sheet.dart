import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/cubit/radio_cubit/radio_cubit.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_top_shape_in_bottom_sheet.dart';
import 'package:sinna/features/profile/presentation/manager/academic_info_update/academic_info_update_cubit.dart';
import 'package:sinna/features/profile/presentation/manager/program_filter_cubit.dart';
import 'package:sinna/features/profile/presentation/manager/specialization_filter_cubit.dart';
import 'package:sinna/features/profile/presentation/manager/levels_radio_cubit.dart';
import 'package:sinna/features/profile/presentation/widgets/institutions_info_widget.dart';
import 'package:sinna/features/profile/presentation/widgets/title_in_buttom_sheet_widget.dart';
import 'package:sinna/features/profile/presentation/widgets/dialog_and_bottom_sheet_fun/apply_button_widget.dart';
import 'package:sinna/features/profile/presentation/widgets/program_filter_bottom_sheet_widget.dart';
import 'package:sinna/features/profile/presentation/widgets/specilalization_filter_bottom_sheet_widget.dart';
import 'package:sinna/features/profile/presentation/widgets/levels_widget.dart';
import 'package:sinna/features/profile/presentation/widgets/custom_bottom_sheet.dart';

void filterContentBottomSheet(BuildContext context) {
  CustomBottomSheet.show(
    context: context,
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
        child: SingleChildScrollView(
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
                  const CustomTopShapeINBottomSheet(),
                  const SizedBox(height: 10),
                  const TitleInButtomSheetWidget(),
                  const SizedBox(height: 30),

                  BlocProvider.value(
                    value: specializationCubit,
                    child: const SpecializationFilterBottomSheetWidget(),
                  ),
                  BlocProvider.value(
                    value: programCubit,
                    child: const ProgramFilterBottomSheetWidget(),
                  ),
                  BlocProvider.value(
                    value: universityCubit,
                    child: const InstitutionsInfoWidget(),
                  ),
                  const SizedBox(height: 10),
                  BlocProvider.value(
                    value: levelsCubit,
                    child: const LevelsWidget(),
                  ),
                  const SizedBox(height: 20),
                  ApplyButtonWidget(
                    specializationCubit: specializationCubit,
                    programCubit: programCubit,
                    universityCubit: universityCubit,
                    levelsCubit: levelsCubit,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    ),
  );
}
