import 'package:flutter/material.dart';
import 'package:sinna/features/profile/presentation/widgets/account_setting_screen_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: ProfileScreenBody());
  }
}
