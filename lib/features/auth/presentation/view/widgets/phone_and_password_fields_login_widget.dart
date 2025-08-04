import 'package:flutter/material.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/core/widgets/custom_text_form_field_widget.dart';

class PhoneAndPasswordFieldsLoginWidget extends StatelessWidget {
  const PhoneAndPasswordFieldsLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Phone number",
          style: AppStyles.textStyle14(
            context,
          ).copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 5),
        CustomTextFieldWidget(
          hintText: "Enter your phone number",
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 15),
        Text(
          "Password",
          style: AppStyles.textStyle14(
            context,
          ).copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 5),
        CustomTextFormFieldWidget(hintText: "Enter your password"),
      ],
    );
  }
}
