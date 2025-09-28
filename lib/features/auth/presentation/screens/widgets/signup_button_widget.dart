import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_snak_bar.dart';
import 'package:sinna/features/auth/data/models/user_base_model.dart';
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
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) async {
        if (state is SignupSuccessState) {
          (context).go(AppRouter.kStepsAcademicScreen);
          await FirebaseMessaging.instance.subscribeToTopic("allUsers");
        }
        if (state is SignupFailedState) {
          // ignore: use_build_context_synchronously
          customSnakBar(context, message: state.error);
        }
      },
      builder: (context, state) {
        if (state is SignupLoadingState) {
          return const Center(child: CircularProgressIndicator());

          // ignore: unnecessary_type_check
        } else if (state is SignupSuccessState || state is SignUpState) {
          return CustomButton(
            width: AppMedia.width(context),
            text: "Sign Up",
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                if (confirmPasswordController.text == passwordController.text) {
                  await cubit.signUp(
                    password: passwordController.text,
                    userBaseModel: UserBaseModel(
                      name: nameController.text,
                      email: emailController.text,
                    ),
                  );
                }
              }
            },
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
