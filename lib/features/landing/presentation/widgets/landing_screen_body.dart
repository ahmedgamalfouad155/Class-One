import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/default_button_widget.dart';

class LandingScreenBody extends StatelessWidget {
  const LandingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Ready When You Are", style: AppStyles.textStyle24Bold(context)),
          const SizedBox(height: 5),
          Text(
            "Explore academic and professional courses designed for every stage of your career.",
            style: AppStyles.textStyle16w400Grey(context),
          ),
          const SizedBox(height: 30),
          CustomButton(
            text: "Sign in with Email",
            onPressed: () => GoRouter.of(context).push(AppRouter.kLogInScreen),
          ),
          const SizedBox(height: 10),
          DefaultButtonWidget(
            text: "Continue with Google",
            onPressed: () {},
            bacgrouncColor: context.appColors.white,
            textColor: context.appColors.black,
            icon: SvgPicture.asset(AppImages.google),
            borderSideColor: context.appColors.greyNavBar,
          ),
          const SizedBox(height: 10),
          DefaultButtonWidget(
            text: "Continue with Apple",
            onPressed: () {},
            bacgrouncColor: context.appColors.white,
            textColor: context.appColors.black,
            icon: Icon(Icons.apple),
            borderSideColor: context.appColors.greyNavBar,
          ),
          TextButton(
            onPressed: () => GoRouter.of(context).push(AppRouter.kSignUpScreen),
            child: Text(
              "Sign up Free",
              style: AppStyles.textStyle16W600(
                context,
              ).copyWith(color: context.appColors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
