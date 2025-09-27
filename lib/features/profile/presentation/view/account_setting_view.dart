import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/profile/presentation/view/widgets/account_setting_view_body.dart';

class AccountSettingView extends StatelessWidget {
  const AccountSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Account Setting", style: AppStyles.textStyle16(context)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: context.appColors.black),
        ),
      ),
      body: AccountSettingViewBody(),
    );
  }
}
