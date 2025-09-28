import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    this.bacgrouncColor,
    this.textColor,
    this.borderRadius,
    this.width,
    this.height,
    this.borderSideColor,
    required this.text,
    required this.onPressed,
  });
  final void Function()? onPressed;
  Color? bacgrouncColor;
  Color? textColor;
  Color? borderSideColor;
  final BorderRadius? borderRadius;
  final String text;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 40.h,
      width: width ?? MediaQuery.of(context).size.width.w,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: bacgrouncColor ?? context.appColors.blue,
          side: BorderSide(color: borderSideColor ?? context.appColors.blue),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: AppStyles.textStyle18Bold(context).copyWith(
            fontWeight: FontWeight.w600,
            color: textColor ?? context.appColors.white,
          ),
        ),
      ),
    );
  }
}
