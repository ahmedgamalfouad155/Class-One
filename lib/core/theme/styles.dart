import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinna/core/theme/colors.dart';

abstract class AppStyles {
  static TextStyle textStyle18(BuildContext context) => TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: context.appColors.blue,
  );

  static TextStyle textStyle20(BuildContext context) => TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: context.appColors.primaryBlue,
  );

  static TextStyle textStyle14(BuildContext context) => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: context.appColors.primaryBlue,
  );

  static TextStyle textStyle16(BuildContext context) => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: context.appColors.primaryBlue,
  );

  static TextStyle textStyle24(BuildContext context) => TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: context.appColors.black,
  );

  static TextStyle textStyle12(BuildContext context) => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: context.appColors.grey,
  );

  static TextStyle textStyle22(BuildContext context) => TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    color: context.appColors.black,
  );
}
