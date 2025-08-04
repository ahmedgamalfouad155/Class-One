import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/core/widgets/custom_text_form_field_widget.dart';
import 'package:sinna/features/auth/presentation/view/widgets/phone_field_widget.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.logo, height: 100),
              const SizedBox(height: 20),
              Text("Welcom", style: AppStyles.textStyle18(context)),
              Text(
                "Please enter your details.",
                style: AppStyles.textStyle14(context),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: AppStyles.textStyle14(
                      context,
                    ).copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5),
                  CustomTextFieldWidget(hintText: "Enter your Name"),
                  const SizedBox(height: 15),
                  Text(
                    "Phone",
                    style: AppStyles.textStyle14(
                      context,
                    ).copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5),
                  PhoneFieldWidget(hintText: "Enter your phone"),
                  const SizedBox(height: 15),
                  Text(
                    "Password",
                    style: AppStyles.textStyle14(
                      context,
                    ).copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5),
                  CustomTextFormFieldWidget(hintText: "Enter your password"),
                  const SizedBox(height: 15),
                  Text(
                    "confirm Password",
                    style: AppStyles.textStyle14(
                      context,
                    ).copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5),
                  CustomTextFormFieldWidget(
                    hintText: "confirm your password",
                    keyboardType: TextInputType.phone,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomButon(
                text: "Next",
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kfinishingSignUpView);
                },
                width: AppMedia.width(context) / 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
