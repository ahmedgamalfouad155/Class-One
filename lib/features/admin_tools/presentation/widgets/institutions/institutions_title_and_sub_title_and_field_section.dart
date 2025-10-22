
import 'package:flutter/material.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';

class InstitutionsTitleAndSubTitleAndFieldSection extends StatelessWidget {
  const InstitutionsTitleAndSubTitleAndFieldSection({
    super.key,
    required this.institutionController,
  });

  final TextEditingController institutionController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Create Institution", style: AppStyles.textStyle16W600(context)),
        const SizedBox(height: 8),
        Text(
          "Add a new institution to associate with courses and instructors.",
          style: AppStyles.textStyle16W600Grey(context),
        ),
        const SizedBox(height: 12),
        CustomTextFieldWidget(
          hintText: "Institution Name",
          controller: institutionController,
        ),
      ],
    );
  }
}
