import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/core/widgets/custom_text_form_field_widget.dart';
import 'package:sinna/features/auth/presentation/manager/password_visibility_cubit.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class SignupNameAndEmailAndPaswordFieldsSectionWidget extends StatelessWidget {
  const SignupNameAndEmailAndPaswordFieldsSectionWidget({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.name.tr(),
          style: AppStyles.textStyle16W600Grey(context),
        ),
        const SizedBox(height: 5),
        CustomTextFieldWidget(
          hintText: LocaleKeys.name.tr(),
          controller: nameController,
        ),
        const SizedBox(height: 15),
        Text(
          LocaleKeys.email.tr(),
          style: AppStyles.textStyle16W600Grey(context),
        ),
        const SizedBox(height: 5),
        CustomTextFieldWidget(
          hintText: "email@domain.com",
          controller: emailController,
          vlaidationMessage: LocaleKeys.enter_avalid_email.tr(),
        ),

        const SizedBox(height: 15),
        Text(
          LocaleKeys.password.tr(),
          style: AppStyles.textStyle16W600Grey(context),
        ),
        const SizedBox(height: 5),
        BlocProvider(
          create: (context) => PasswordVisibilityCubit(),
          child: CustomTextFormFieldWidget(
            hintText: LocaleKeys.password.tr(),
            controller: passwordController, 
          ),
        ),
        const SizedBox(height: 15),
        Text(
          LocaleKeys.confirm_password.tr(),
          style: AppStyles.textStyle16W600Grey(context),
        ),
        const SizedBox(height: 5),
        BlocProvider(
          create: (context) => PasswordVisibilityCubit(),
          child: CustomTextFormFieldWidget(
            hintText: LocaleKeys.confirm_password.tr(),
            controller: confirmPasswordController,
          ),
        ),
      ],
    );
  }
}
