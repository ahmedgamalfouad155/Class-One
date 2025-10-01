import 'package:flutter/material.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/profile/presentation/screen/widgets/account_setting_screen_body.dart';

class AccountSettingScreen extends StatelessWidget {
  const AccountSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Account Setting",
          style: AppStyles.textStyle16W600(context),
        ),
      ),
      body: AccountSettingScreenBody(),
    );
  }
}
