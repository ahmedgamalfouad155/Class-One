import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_snak_bar.dart';
import 'package:sinna/features/auth/data/models/user_base_model.dart';
import 'package:sinna/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:sinna/features/auth/presentation/manager/signup_cubit/signup_state.dart';
import 'package:sinna/features/auth/presentation/widgets/show_confirm_dialog.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class SignupButtonWidget extends StatelessWidget {
  const SignupButtonWidget({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.formKey,
  });

  final TextEditingController nameController,
      emailController,
      passwordController,
      confirmPasswordController; 
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) async {
        if (state is SignupEmailSentState) {
          showConfirmDialog(
            context,
            context.read<SignUpCubit>(),
            state.userBaseModel,
          );
        }

        if (state is SignupFailedState) {
          customSnakBar(context, message: state.error);
        }
      },
      builder: (context, state) {
        if (state is SignupLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        return CustomButton(
          width: context.width,
          text: LocaleKeys.sign_up.tr(),
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
              } else {
                customSnakBar(context, message: "Passwords do not match");
              }
            }
          },
        );
      },
    );
  }
} 
