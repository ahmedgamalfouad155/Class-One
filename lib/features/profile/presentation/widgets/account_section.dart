import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/profile/presentation/widgets/dialog_and_bottom_sheet_fun/filter_content_bottom_sheet.dart';
import 'package:sinna/core/widgets/custom_option_widget.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.account.tr(),
          style: AppStyles.textStyle16w400Grey(context),
        ),
        Column(
          children: [
            CustomOptionWidget(
              title: LocaleKeys.profile.tr(),
              onTap: () {
                GoRouter.of(context).push(AppRouter.kAccountScreen);
              },
            ),
            CustomOptionWidget(
              title: LocaleKeys.preferences.tr(),
              onTap: () {
                filterContentBottomSheet(context);
              },
            ),
          ],
        ),
      ],
    );
  }
}
