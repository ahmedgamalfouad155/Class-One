import 'package:flutter/material.dart';
import 'package:sinna/features/profile/presentation/widgets/account_setting_screen_body.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: AccountScreenBody());
  }
}
