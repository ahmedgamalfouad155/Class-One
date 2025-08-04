import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customSnakBar(
  BuildContext context, {
  required String message,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 500),
      backgroundColor: context.appColors.blue,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
