import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class CourseTitleAndImageSection extends StatelessWidget {
  const CourseTitleAndImageSection({
    super.key,
    required this.courseTitleController,
    required this.photoUrlController,
  });

  final TextEditingController courseTitleController;
  final TextEditingController photoUrlController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.course_title.tr(),
          style: AppStyles.textStyle16W600Grey(context),
        ),
        const SizedBox(height: 12),
        CustomTextFieldWidget(
          hintText: "e.g., Endodontics Basics",
          controller: courseTitleController,
          vlaidationMessage: LocaleKeys.enter_valid_course_title.tr(),
        ),

        const SizedBox(height: 10),
        Text(
          LocaleKeys.photo_link.tr(),
          style: AppStyles.textStyle16W600Grey(context),
        ),
        const SizedBox(height: 12),
        CustomTextFieldWidget(
          hintText: "https://example.com/image.jpg",
          controller: photoUrlController,
          vlaidationMessage: LocaleKeys.enter_valid_photo_link.tr(),
        ), 
        const SizedBox(height: 10),
      ],
    );
  }
}
