import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class AddvancedSettingsAndIconWidget extends StatelessWidget {
  const AddvancedSettingsAndIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundColor: context.appColors.greyBackgroundTextFiled,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close, color: context.appColors.black),
          ),
        ),
        Text(
          LocaleKeys.addvanced_settings.tr(),
          style: AppStyles.textStyle16W600(context),
        ),
      ],
    );
  }
}
