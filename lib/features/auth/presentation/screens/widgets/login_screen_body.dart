import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:sinna/features/auth/presentation/screens/widgets/having_account_and_forget_password_loing_text_widget.dart';
import 'package:sinna/features/auth/presentation/screens/widgets/email_and_password_fields_login_widget.dart';
import 'package:sinna/features/auth/presentation/screens/widgets/login_button_widget.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.logo, height: 100),
                const SizedBox(height: 20),
                Text("Welcom Back", style: AppStyles.textStyle18Bold(context)),
                Text(
                  "Please enter your details.",
                  style: AppStyles.textStyle14W600(context),
                ),
                const SizedBox(height: 20),
                EmailAndPasswordFieldsLoginWidget(
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                const SizedBox(height: 20),
                HavingAccountAndForgetPasswordLoginTextWidget(),
                const SizedBox(height: 40),
                BlocProvider(
                  create: (context) => LoginCubit(),
                  child: LoginButtonWidget(
                    formKey: formKey,
                    passwordController: passwordController,
                    emailController: emailController,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
