
import 'package:flutter/material.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';

class InstructorTitleAndSubTitleAndFieldWidget extends StatelessWidget {
  const InstructorTitleAndSubTitleAndFieldWidget({
    super.key,
    required this.nameController,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Create Instructor", style: AppStyles.textStyle16W600(context)),
        const SizedBox(height: 8),
        Text(
          "Add a new instructor profile to assign courses.",
          style: AppStyles.textStyle16W600Grey(context),
        ),
        const SizedBox(height: 12),
        CustomTextFieldWidget(
          hintText: "Instructor Name",
          controller: nameController,
        ),
      ],
    );
  }
}
