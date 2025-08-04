import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';

// ignore: must_be_immutable
class DefaultButtonWidget extends StatelessWidget {
  DefaultButtonWidget({
    super.key,
    this.bacgrouncColor,
    this.textColor,
    this.borderRadius,
    this.width,
    this.height,
    required this.text,
    required this.onPressed,
    this.icon,
    this.style,
  });
  final void Function()? onPressed;
  Color? bacgrouncColor;
  Color? textColor;
  final BorderRadius? borderRadius;
  final String text;
  final double? width, height;
  final Widget? icon;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 40.h,
      width: width ?? MediaQuery.of(context).size.width.w,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: bacgrouncColor ?? context.appColors.blue,
          side: BorderSide(color: context.appColors.blue),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ?icon,
            const SizedBox(width: 5),
            Text(
              text,
              style:
                  style ??
                  AppStyles.textStyle16(context).copyWith(
                    fontWeight: FontWeight.w700,
                    color: textColor ?? context.appColors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
