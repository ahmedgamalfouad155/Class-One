import 'package:flutter/material.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/core/widgets/custom_top_shape_in_bottom_sheet.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/attachment_section.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/create_lesson_text_and_bback_icon_widget.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/lesson_placement_section.dart';
import 'package:sinna/features/profile/presentation/widgets/custom_bottom_sheet.dart';

void createLessonBottomSheet(BuildContext context) {
  CustomBottomSheet.show(
    context: context,
    child: ConstrainedBox(
      constraints: BoxConstraints(maxHeight: context.height * .97),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: CustomTopShapeINBottomSheet()),
            const SizedBox(height: 10),
            CreateLessonTextAndBackIconWidget(),
            const SizedBox(height: 16),
            CustomTextFieldWidget(hintText: "Impression Techniques for Crowns"),
            CustomDividerWidget(isHeight: true),
            Text("Video URL", style: AppStyles.textStyle16W600Grey(context)),
            const SizedBox(height: 12),
            CustomTextFieldWidget(hintText: "https://youtu.be/abcd1234"),
            CustomDividerWidget(isHeight: true),
            Text("Duration", style: AppStyles.textStyle16W600Grey(context)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: context.width / 2.5,
                  child: CustomTextFieldWidget(hintText: "Hours"),
                ),
                const SizedBox(width: 15),
                SizedBox(
                  width: context.width / 2.5,
                  child: CustomTextFieldWidget(hintText: "Minutes"),
                ),
              ],
            ),
            CustomDividerWidget(isHeight: true),
            AttachmentsSection(),
            const SizedBox(height: 12),
            LessonPlacementSection(),
            const SizedBox(height: 12),
            CustomButton(text: "Save", onPressed: () {}),
          ],
        ),
      ),
    ),
  );
}
