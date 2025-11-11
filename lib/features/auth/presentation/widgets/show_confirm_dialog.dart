import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_snak_bar.dart';
import 'package:sinna/core/widgets/default_button_widget.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/cancel_button_widget.dart';
import 'package:sinna/features/auth/data/models/user_info_model.dart';
import 'package:sinna/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:sinna/features/auth/presentation/manager/signup_cubit/signup_state.dart';

void showConfirmDialog(
  BuildContext context,
  SignUpCubit signUpCubit,
  UserInfoModel userBaseModel,
) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return BlocProvider.value(
        value: signUpCubit,
        child: BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) async {
            if (state is SignupSuccessState) {
              Navigator.of(context).pop();
              context.go(AppRouter.kNavBarScreen);
            } else if (state is SignupEmailNotVerifiedState) {
              customSnakBar(context, message: state.message);
            } else if (state is SignupFailedState) {
              customSnakBar(context, message: state.error);
            }
          },
          builder: (context, state) {
            return AlertDialog(
              backgroundColor: context.appColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: Column(
                children: [
                  const Icon(
                    Icons.email_outlined,
                    size: 64,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Confirm Your Email Address",
                    style: AppStyles.textStyle20W600(context),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "A confirmation link has been sent to your email.Please verify your email, then click Confirm.",
                    textAlign: TextAlign.center,
                    style: AppStyles.textStyle16W600Grey(context),
                  ),
                  const SizedBox(height: 20),
                  if (state is SignupLoadingState)
                    const CircularProgressIndicator(),
                ],
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                DefaultButtonWidget(
                  icon: Icon(
                    Icons.check_circle_outline,
                    color: context.appColors.white,
                  ),
                  text: "Confirm",
                  onPressed: () async {
                    await signUpCubit.checkEmailVerificationManually(
                      userBaseModel,
                    );
                  },
                ),
                const SizedBox(height: 10),
                DefaultButtonWidget(
                  icon: Icon(
                    Icons.email_rounded,
                    size: 18,
                    color: context.appColors.blue,
                  ),
                  text: "Resend Email",
                  bacgrouncColor: context.appColors.white,
                  textColor: context.appColors.blue,
                  onPressed: () async {
                    final user = signUpCubit.firebaseAuth.currentUser;

                    if (user != null && !user.emailVerified) {
                      await user.sendEmailVerification();
                      customSnakBar(
                        // ignore: use_build_context_synchronously
                        context,
                        message: "تم إعادة إرسال رابط التأكيد",
                      );
                    } else {
                      customSnakBar(
                        context,
                        message: 'تم تفعيل البريد بالفعل ✅',
                      );
                    }
                  },
                ),
                const SizedBox(height: 10),
                CustomCancelTextWidget(),
              ],
            );
          },
        ),
      );
    },
  );
}
