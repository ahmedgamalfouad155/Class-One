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
    this.borderSideColor,
    this.borderRadius,
    this.width,
    this.height,
    required this.text,
    required this.onPressed,
    this.icon,
    this.textStyle,
  });
  final void Function()? onPressed;
  Color? bacgrouncColor;
  Color? textColor;
  Color? borderSideColor;
  final BorderRadius? borderRadius;
  final String text;
  final double? width, height;
  final Widget? icon;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height ?? 40.h,
        width: width ?? MediaQuery.of(context).size.width.w,
        decoration: BoxDecoration(
          color: bacgrouncColor ?? context.appColors.blue,
          borderRadius: borderRadius ?? BorderRadius.circular(10.r),
          border: Border.all(
            color: borderSideColor ?? context.appColors.blue,
            width: 1,
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
                  textStyle ??
                  AppStyles.textStyle16W600(
                    context,
                  ).copyWith(color: textColor ?? context.appColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
