import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/profile/presentation/widgets/account_setting_screen_body.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class AccountSettingScreen extends StatelessWidget {
  const AccountSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          LocaleKeys.account_setting.tr(),
          style: AppStyles.textStyle16W600(context),
        ),
      ),
      body: AccountSettingScreenBody(),
    );
  }
}
