import 'package:flutter/material.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/profile/presentation/widgets/password_screen_body.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Password", style: AppStyles.textStyle20W600(context)),
        centerTitle: false,
      ),
      body: PasswordScreenBody(),
    );
  }
}
