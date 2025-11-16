import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/core/widgets/custom_option_widget.dart';
import 'package:sinna/features/profile/presentation/widgets/delete_account_dialog_widget.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.profile.tr(),
            style: AppStyles.textStyle24W600(context),
          ),
          SizedBox(height: 20.h),
          CustomOptionWidget(
            title: LocaleKeys.name.tr(),
            onTap: () {
              GoRouter.of(context).push(AppRouter.kNameScreen);
            },
          ),
          SizedBox(height: 10.h),
          CustomOptionWidget(
            title: LocaleKeys.password.tr(),
            onTap: () {
              GoRouter.of(context).push(AppRouter.kPasswordScreen);
            },
          ),

          CustomDividerWidget(isHeight: true),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => const DeleteAccountDialogWidget(),
              );
            },
            child: Text(
              LocaleKeys.delete_account.tr(),
              style: AppStyles.textStyle16W600(
                context,
              ).copyWith(color: context.appColors.red),
            ),
          ),
        ],
      ),
    );
  }
}
