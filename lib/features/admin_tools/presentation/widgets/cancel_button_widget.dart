import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class CustomCancelTextWidget extends StatelessWidget {
  const CustomCancelTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pop(context),
      child: Text(
          LocaleKeys.cancel.tr(),
        style: AppStyles.textStyle15W600(
          context,
        ).copyWith(color: context.appColors.blue),
      ),
    );
  }
}
