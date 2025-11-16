import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/profile/presentation/widgets/password_screen_body.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.password.tr(),
          style: AppStyles.textStyle20W600(context),
        ),
        centerTitle: false,
      ),
      body: PasswordScreenBody(),
    );
  }
}
