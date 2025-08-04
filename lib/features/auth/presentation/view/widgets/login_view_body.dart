import 'package:flutter/material.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/auth/presentation/view/widgets/having_account_and_forget_password_loing_text_widget.dart';
import 'package:sinna/features/auth/presentation/view/widgets/phone_and_password_fields_login_widget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.logo, height: 100),
              const SizedBox(height: 20),
              Text("Welcom Back", style: AppStyles.textStyle18(context)),
              Text(
                "Please enter your details.",
                style: AppStyles.textStyle14(context),
              ),
              const SizedBox(height: 20),
              PhoneAndPasswordFieldsLoginWidget(),
              const SizedBox(height: 20),
              HavingAccountAndForgetPasswordLoginTextWidget(),
              const SizedBox(height: 40),
              CustomButon(text: "Login", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
