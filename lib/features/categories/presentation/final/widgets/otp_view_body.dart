import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/categories/presentation/final/manager/phone_auth_cubit.dart';
import 'package:sinna/features/categories/presentation/final/manager/phone_auth_state.dart';
import 'package:sinna/features/categories/presentation/final/widgets/otp_fields_widget.dart';

class OtpViewBody extends StatelessWidget {
  const OtpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    String smsCode = ""; // هنخزن الكود هنا

    return BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
      listener: (context, state) {
        if (state is PhoneAuthVerified) {
          // ✅ لو اتأكد الكود → نكمل للصفحة اللي بعدها
          GoRouter.of(context).push(AppRouter.kStudyLocationView);
        }

        if (state is PhoneAuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(right: 32.0, left: 32.0, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                  color: context.appColors.grey,
                ),
              ),
              SizedBox(height: AppMedia.height(context) / 9),
              Text("Enter Code", style: AppStyles.textStyle32(context)),
              const SizedBox(height: 8),
              Text(
                "Use the verification code we sent to complete this step",
                style: AppStyles.textStyle16w400(context),
              ),
              const SizedBox(height: 32),

              // ✅ استدعاء الـ OTP Widget
              OtpFieldWidget(
                onCompleted: (value) {
                  smsCode = value;
                },
              ),
              const SizedBox(height: 32),

              state is PhoneAuthLoading
                  ? const Center(child: CircularProgressIndicator())
                  : CustomButton(
                      text: "Verify",
                      onPressed: () {
                        if (smsCode.isNotEmpty) {
                          // ✅ التحقق من الكود
                          // context
                          //     .read<PhoneAuthCubit>()
                          //     .verifySmsCode(verificationId, smsCode);
                        }
                      },
                    ),
            ],
          ),
        );
      },
    );
  }
}
