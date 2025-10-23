import 'package:flutter/material.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';

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
        Text("Course Title", style: AppStyles.textStyle16W600Grey(context)),
        const SizedBox(height: 12),
        CustomTextFieldWidget(
          hintText: "Introduction to Prosthodontics",
          controller: courseTitleController,
        ),
        CustomDividerWidget(isHeight: true, height: 20),
        const SizedBox(height: 10),
        Text("Photo URL", style: AppStyles.textStyle16W600Grey(context)),
        const SizedBox(height: 12),
        CustomTextFieldWidget(
          hintText: "https://example.com/image.jpg",
          controller: photoUrlController,
        ),
        CustomDividerWidget(isHeight: true, height: 20),
        const SizedBox(height: 10),
      ],
    );
  }
}
