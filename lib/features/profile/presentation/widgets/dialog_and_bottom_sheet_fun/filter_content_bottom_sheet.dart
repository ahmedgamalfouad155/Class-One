import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/cubit/radio_cubit/radio_cubit.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_top_shape_in_bottom_sheet.dart';
import 'package:sinna/features/profile/presentation/manager/chekbox_cubit/check_box_cubit.dart';
import 'package:sinna/features/profile/presentation/widgets/acadimic_info_widget.dart';
import 'package:sinna/features/profile/presentation/widgets/addvanced_settings_and_icon_widget.dart';
import 'package:sinna/features/profile/presentation/widgets/program_filter_bottom_sheet_widget.dart';
import 'package:sinna/features/profile/presentation/widgets/specilalization_filter_bottom_sheet_widget.dart';
import 'package:sinna/features/profile/presentation/widgets/under_and_post_gragduate_section.dart';
import 'package:sinna/features/profile/presentation/widgets/custom_bottom_sheet.dart';

void filterContentBottomSheet(BuildContext context) {
  CustomBottomSheet.show(
    context: context,
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
                CustomTopShapeINBottomSheet(),
                const SizedBox(height: 10),
                AddvancedSettingsAndIconWidget(),
                const SizedBox(height: 30),
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
                        final selected = context
                            .read<CheckBoxCubit>()
                            .getSelectedItems();
                        print("Selected items: $selected");

                        final radioo = context.read<RadioCubit>().confirmed;
                        print("Selected radio: $radioo");
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
