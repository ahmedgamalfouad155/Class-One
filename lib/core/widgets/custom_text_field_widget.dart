import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.hintText,
    this.controller,
    this.keyboardType,
    this.icon,
    this.vlaidationMessage,
  });

  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? icon;
  final String? vlaidationMessage;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      cursorColor: context.appColors.blue,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return vlaidationMessage ?? '${LocaleKeys.enter_your.tr()} $hintText';
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: icon,
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
