import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_animated_dialod.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/features/auth/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:sinna/features/auth/presentation/manager/forget_password_cubit/forget_password_state.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class ForgetPasswordScreenBody extends StatefulWidget {
  const ForgetPasswordScreenBody({super.key});

  @override
  State<ForgetPasswordScreenBody> createState() =>
      _ForgetPasswordScreenBodyState();
}

class _ForgetPasswordScreenBodyState extends State<ForgetPasswordScreenBody> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Reset Password", style: AppStyles.textStyle32(context)),
              const SizedBox(height: 10),
              Text(
                "Enter your registered email, and we’ll send a reset link to your inbox",
                style: AppStyles.textStyle14W600(
                  context,
                ).copyWith(color: context.appColors.grey),
              ),
              const SizedBox(height: 30),
              Text(
                LocaleKeys.email.tr(),
                style: AppStyles.textStyle16W600Grey(context),
              ),
              const SizedBox(height: 5),
              CustomTextFieldWidget(
                hintText: "email@domain.com",
                vlaidationMessage: LocaleKeys.enter_avalid_email.tr(),
                controller: emailController,
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
                  listener: (context, state) {
                    if (state is ForgetPasswordSuccess) {
                      CustomAnimatedDialog.show(
                        context: context,
                        message: state.message,
                        animationType: DialogAnimationType.success,
                      );
                    } else if (state is ForgetPasswordFailure) {
                      CustomAnimatedDialog.show(
                        context: context,
                        message: state.errorMessage,
                        animationType: DialogAnimationType.error,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is ForgetPasswordLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is ForgetPasswordSuccess ||
                        state is ForgetPasswordInitial) {
                      return CustomButton(
                        text: "Sent",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<ForgetPasswordCubit>().sendResetEmail(
                              emailController.text.trim(),
                            );
                          }
                        },
                        width: context.width / 4,
                        borderRadius: BorderRadius.circular(30),
                      );
                    } else {
                      print(state);
                      return const Center(child: Text("Error"));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


