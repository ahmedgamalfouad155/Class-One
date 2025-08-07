import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_snak_bar.dart';
import 'package:sinna/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:sinna/features/auth/presentation/manager/signup_cubit/signup_state.dart';

class SignupButtonWidget extends StatelessWidget {
  const SignupButtonWidget({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.formKey,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    final user = context.watch<SignUpCubit>().state.user;
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignupSuccessState) {
          (context).go(AppRouter.kNavBarView);
        }
        if (state is SignupFailedState) {
          customSnakBar(context, message: state.error);
        }
      },
      builder: (context, state) {
        if (state is SignupLoadingState) {
          return const Center(child: CircularProgressIndicator());
          // ignore: unnecessary_type_check
        } else if (state is SignupSuccessState || state is SignUpState) {
          return CustomButton(
            text: "Sign Up",
            onPressed: () async {
              final updatedUser = user.copyWith(
                name: nameController.text,
                email: emailController.text,
              );
              cubit.updateUser(updatedUser);

              if (formKey.currentState!.validate()) {
                if (confirmPasswordController.text == passwordController.text) {
                  await cubit.signUp(passwordController.text, updatedUser);
                }
              }
            },
            width: AppMedia.width(context) / 3,
          );
        } else if (state is SignupFailedState) {
          return Text(state.error);
        } else {
          return const Text('Error');
        }
      },
    );
  }
}

/*
egypt
mansoura
Bachelors
level one
 */
