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
          // return '${S.of(context).pleaseEnterYour} $hintText';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppStyles.textStyle16(context),
        fillColor: context.appColors.offWhite,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: context.appColors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: context.appColors.blue),
        ),
      ),
    );
  }
}
