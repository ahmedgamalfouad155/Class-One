import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/features/auth/presentation/widgets/phone_field_widget.dart';
import 'package:sinna/features/final_ui/manager/phone_auth_cubit.dart';
import 'package:sinna/features/final_ui/manager/phone_auth_state.dart';

class RegisterScreenBody extends StatefulWidget {
  const RegisterScreenBody({super.key});

  @override
  State<RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<RegisterScreenBody> {
  final nameController = TextEditingController();
  String? phoneNumber; // ✅ نخزن الرقم هنا
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
      listener: (context, state) {
        if (state is PhoneAuthCodeSent) {
          GoRouter.of(
            context,
          ).push(AppRouter.kFinalOtpScreen, extra: state.verificationId);
        }

        if (state is PhoneAuthError) {
          log(state.message);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(right: 32.0, left: 32.0, top: 40),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => GoRouter.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                    color: context.appColors.grey,
                  ),
                ),
                SizedBox(height: context.height / 8),
                Text("Register", style: AppStyles.textStyle32(context)),
                const SizedBox(height: 8),
                Text(
                  "Create an Account to get started",
                  style: AppStyles.textStyle16w400Grey(context),
                ),
                const SizedBox(height: 32),
                CustomTextFieldWidget(
                  hintText: "Name",
                  controller: nameController,
                ),
                const SizedBox(height: 16),

                // ✅ هنا الرقم بيتخزن بصيغة E.164 تلقائي
                PhoneFieldWidget(
                  onChanged: (phone) {
                    phoneNumber = phone;
                  },
                ),

                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    state is PhoneAuthLoading
                        ? const CircularProgressIndicator()
                        : CustomButton(
                            text: "Next",
                            onPressed: () {
                              GoRouter.of(
                                context,
                              ).push(AppRouter.kFinalOtpScreen);
                              // // print(phoneNumber);
                              // if (_formKey.currentState!.validate() &&
                              //     phoneNumber != null) {
                              //   context
                              //       .read<PhoneAuthCubit>()
                              //       .verifyPhoneNumber(
                              //         phoneNumber!,
                              //       ); // ✅ الرقم جاهز
                              // }
                            },
                            width: context.width / 5,
                            borderRadius: BorderRadius.circular(25),
                          ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
