import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/cubit/radio_cubit/radio_cubit.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/profile/presentation/manager/chekbox_cubit/check_box_cubit.dart';
import 'package:sinna/features/profile/presentation/widgets/acadimic_info_widget.dart';
import 'package:sinna/features/profile/presentation/widgets/program_filter_bottom_sheet_widget.dart';
import 'package:sinna/features/profile/presentation/widgets/specilalization_filter_bottom_sheet_widget.dart';
import 'package:sinna/features/profile/presentation/widgets/under_and_post_gragduate_section.dart';

class SetupContentWidget extends StatelessWidget {
  const SetupContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocProvider(
        create: (_) => CheckBoxCubit(),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: context.height * .97),
          child: SingleChildScrollView(
            child: BlocProvider(
              create: (context) => RadioCubit(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SpecializationFilterBottomSheetWidget(),
                  ProgramFilterBottomSheetWidget(),
                  AcadimicInfoWidget(),
                  const SizedBox(height: 20),
                  const UnderAndPostGraduateSection(),
                  const SizedBox(height: 20),
                  BlocBuilder<CheckBoxCubit, Map<String, bool>>(
                    builder: (context, state) {
                      return CustomButton(
                        text: "Apply",
                        onPressed: () {
                          // ignore: unused_local_variable
                          final selected = context
                              .read<CheckBoxCubit>()
                              .getSelectedItems();

                          // ignore: unused_local_variable
                          final radioo = context.read<RadioCubit>().confirmed;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
