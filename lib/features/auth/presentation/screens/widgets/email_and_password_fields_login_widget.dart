import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/core/widgets/custom_text_form_field_widget.dart';
import 'package:sinna/features/auth/presentation/manager/password_visibility_cubit.dart';

class EmailAndPasswordFieldsLoginWidget extends StatelessWidget {
  const EmailAndPasswordFieldsLoginWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Email", style: AppStyles.textStyle16W600Grey(context)),
        const SizedBox(height: 5),
        CustomTextFieldWidget(
          hintText: "Enter your email",
          controller: emailController,
        ),
        const SizedBox(height: 16),
        Text("Password", style: AppStyles.textStyle16W600Grey(context)),
        const SizedBox(height: 5),
        BlocProvider(
          create: (context) => PasswordVisibilityCubit(),
          child: CustomTextFormFieldWidget(
            hintText: "Enter your password",
            controller: passwordController,
          ),
        ),
      ],
    );
  }
}
