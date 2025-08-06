import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/core/widgets/custom_text_form_field_widget.dart';
import 'package:sinna/features/auth/presentation/view/manager/password_visibility_cubit.dart';

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
          "Name",
          style: AppStyles.textStyle14(
            context,
          ).copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 5),
        CustomTextFieldWidget(
          hintText: "Enter your Name",
          controller: nameController,
        ),
        const SizedBox(height: 15),
        Text(
          "Email",
          style: AppStyles.textStyle14(
            context,
          ).copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 5),
        CustomTextFieldWidget(
          hintText: "Enter your email",
          controller: emailController,
        ),

        const SizedBox(height: 15),
        Text(
          "Password",
          style: AppStyles.textStyle14(
            context,
          ).copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 5),
        BlocProvider(
          create: (context) => PasswordVisibilityCubit(),
          child: CustomTextFormFieldWidget(
            hintText: "Enter your password",
            controller: passwordController,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          "confirm Password",
          style: AppStyles.textStyle14(
            context,
          ).copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 5),
        BlocProvider(
          create: (context) => PasswordVisibilityCubit(),
          child: CustomTextFormFieldWidget(
            hintText: "confirm your password",
            controller: confirmPasswordController,
          ),
        ),
      ],
    );
  }
}
