import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.hintText,
    this.controller,
    this.keyboardType,
  });

  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      cursorColor: context.appColors.blue,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'pleaseEnterYour $hintText';
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 14),
        hintText: hintText,
        hintStyle: AppStyles.textStyle16W600Grey(
          context,
        ).copyWith(color: context.appColors.greyNavBar),
        fillColor: context.appColors.greyBackgroundTextFiled,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
