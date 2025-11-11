import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';

class CustomCancelTextWidget extends StatelessWidget {
  const CustomCancelTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pop(context),
      child: Text(
        "Cancel",
        style: AppStyles.textStyle15W600(
          context,
        ).copyWith(color: context.appColors.blue),
      ),
    );
  }
}
