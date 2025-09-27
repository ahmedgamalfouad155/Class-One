import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/auth/presentation/view/widgets/phone_field_widget.dart';

class FinalSigninBody extends StatelessWidget {
  const FinalSigninBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 32.0,
        left: 32.0,
        top: AppMedia.height(context) / 5,
        bottom: 32.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Sign in", style: AppStyles.textStyle32(context)),
          const SizedBox(height: 8),
          Text(
            "Please log in to continue",
            style: AppStyles.textStyle16w400Grey(context),
          ),
          const SizedBox(height: 32),
          PhoneFieldWidget(onChanged: (v) {}),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Forgotten Password?",
                style: AppStyles.textStyle14(context),
              ),
            ],
          ),
          const SizedBox(height: 32),
          CustomButton(text: "Lonin", onPressed: () {}),
          const SizedBox(height: 16),
          CustomButton(
            text: "Register",
            bacgrouncColor: context.appColors.white,
            textColor: context.appColors.black,
            borderSideColor: context.appColors.offWhite,
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kFinalRegister);
            },
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Get Support", style: AppStyles.textStyle14(context)),
            ],
          ),
        ],
      ),
    );
  }
}
