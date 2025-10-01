import 'package:flutter/material.dart'; 
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/explore/presentation/screens/widgets/acadimic_info_widget.dart';
import 'package:sinna/features/explore/presentation/screens/widgets/addvanced_settings_and_icon_widget.dart';
import 'package:sinna/features/explore/presentation/screens/widgets/program_filter_bottom_sheet_widget.dart';
import 'package:sinna/features/explore/presentation/screens/widgets/specilalization_filter_bottom_sheet_widget.dart';
import 'package:sinna/features/explore/presentation/screens/widgets/under_and_post_gragduate_section.dart';
import 'package:sinna/features/profile/presentation/screen/widgets/custom_bottom_sheet.dart';

void filterContentBottomSheet(BuildContext context) {
  CustomBottomSheet.show(
    context: context,
    child: ConstrainedBox(
      constraints: BoxConstraints(maxHeight: AppMedia.height(context) * .97),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: context.appColors.greyNavBar,
              ),
            ),
            const SizedBox(height: 10),
            AddvancedSettingsAndIconWidget(),
            const SizedBox(height: 30),
            SpecializationFilterBottomSheetWidget(),
            ProgramFilterBottomSheetWidget(),
            AcadimicInfoWidget(),
            const SizedBox(height: 20),
            UnderAndPostGraduateSection(),
            const SizedBox(height: 20),
            CustomButton(text: "Apply", onPressed: () {}),
          ],
        ),
      ),
    ),
  );
}
