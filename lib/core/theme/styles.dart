import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinna/core/theme/colors.dart';

abstract class AppStyles {
  static TextStyle textStyle32(BuildContext context) =>
      TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold);

  static TextStyle textStyle18Bold(BuildContext context) => TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: context.appColors.black,
  );

  static TextStyle textStyle20W600(BuildContext context) => TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: context.appColors.black,
  );

  static TextStyle textStyle14W600(BuildContext context) => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: context.appColors.black,
  );

  static TextStyle textStyle16W600(BuildContext context) => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: context.appColors.black,
  );
  static TextStyle textStyle16W600Grey(BuildContext context) => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: context.appColors.grey,
  );
  static TextStyle textStyle16w400Grey(BuildContext context) => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: context.appColors.grey,
  );

  static TextStyle textStyle24W600(BuildContext context) => TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: context.appColors.black,
  );

  static TextStyle textStyle12GreyW400(BuildContext context) => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: context.appColors.grey,
  );

  static TextStyle textStyle22Bold(BuildContext context) => TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
    color: context.appColors.black,
  );
}
