import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/categories/presentation/final/widgets/arab_country_dropdown_widger.dart';

class StudyLocationViewBody extends StatelessWidget {
  const StudyLocationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 32.0, left: 32.0, top: 40),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
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

          Text(
            'Select Your Preferred Study Location',
            style: AppStyles.textStyle32(context),
          ),
          const SizedBox(height: 8),
          Text(
            "You can change this setting anytime in your profile after signing in",
            style: AppStyles.textStyle16w400(context),
          ),
          const SizedBox(height: 32),
          ArabCountryDropdown(onCountrySelected: (country) {}),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                text: "Next",
                onPressed: () {
                  // GoRouter.of(context).push(AppRouter.kFinalOtpView);
                },
                width: AppMedia.width(context) / 5,
                borderRadius: BorderRadius.circular(25),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
