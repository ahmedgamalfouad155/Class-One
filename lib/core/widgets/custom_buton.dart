import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';

// ignore: must_be_immutable
class CustomButon extends StatelessWidget {
  CustomButon({
    super.key,
    this.bacgrouncColor,
    this.textColor,
    this.borderRadius,
    this.width,
    this.height,
    required this.text,
    required this.onPressed,
  });
  final void Function()? onPressed;
  Color? bacgrouncColor;
  Color? textColor;
  final BorderRadius? borderRadius;
  final String text;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50.h,
      width: width ?? MediaQuery.of(context).size.width.w,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: bacgrouncColor ?? context.appColors.blue,
          side: BorderSide(color: context.appColors.blue),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: AppStyles.textStyle18(context).copyWith(
            fontWeight: FontWeight.w700,
            color: textColor ?? context.appColors.white,
          ),
        ),
      ),
    );
  }
}
