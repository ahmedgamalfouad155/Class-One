import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/generated/locale_keys.g.dart';

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
          Text(
            LocaleKeys.ready_when_you_are.tr(),
            style: AppStyles.textStyle24W600(context),
          ),
          const SizedBox(height: 5),
          Text(
            LocaleKeys.explore_academic_and_professional_courses.tr(),
            style: AppStyles.textStyle16w400Grey(context),
          ),
          const SizedBox(height: 30),
          CustomButton(
            text: LocaleKeys.sign_in_with_email.tr(),
            onPressed: () => GoRouter.of(context).push(AppRouter.kLogInScreen),
          ),
          const SizedBox(height: 10),
          CustomButton(
            text: LocaleKeys.sign_up_free.tr(),
            onPressed: () => GoRouter.of(context).push(AppRouter.kSignUpScreen),
            bacgrouncColor: context.appColors.white,
            textColor: context.appColors.black,
            borderSideColor: context.appColors.blue,
          ),
        ],
      ),
    );
  }
}
