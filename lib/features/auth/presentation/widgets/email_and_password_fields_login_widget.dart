import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/core/widgets/custom_text_form_field_widget.dart';
import 'package:sinna/features/auth/presentation/manager/password_visibility_cubit.dart';
import 'package:sinna/generated/locale_keys.g.dart';

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
        Text(
          LocaleKeys.email.tr(),
          style: AppStyles.textStyle16W600Grey(context),
        ),
        const SizedBox(height: 5),
        CustomTextFieldWidget(
          hintText: "example@domain.com",
          controller: emailController,
          vlaidationMessage: LocaleKeys.enter_avalid_email.tr(),
        ),
        const SizedBox(height: 16),
        Text(
          LocaleKeys.password.tr(),
          style: AppStyles.textStyle16W600Grey(context),
        ),
        const SizedBox(height: 5),
        BlocProvider(
          create: (context) => PasswordVisibilityCubit(),
          child: CustomTextFormFieldWidget(
            hintText: "••••••••••••",
            controller: passwordController,
            vlaidationMessage: LocaleKeys.enter_avalid_password.tr(),
          ),
        ),
      ],
    );
  }
}
