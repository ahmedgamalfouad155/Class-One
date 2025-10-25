import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:sinna/features/auth/presentation/widgets/having_account_and_forget_password_loing_text_widget.dart';
import 'package:sinna/features/auth/presentation/widgets/email_and_password_fields_login_widget.dart';
import 'package:sinna/features/auth/presentation/widgets/login_button_widget.dart';
import 'package:sinna/generated/locale_keys.g.dart';

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
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                 LocaleKeys.continue_with_email.tr() ,
                  style: AppStyles.textStyle16W600(context),
                ),
                const SizedBox(height: 20),
                EmailAndPasswordFieldsLoginWidget(
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                // const SizedBox(height: 10),
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
