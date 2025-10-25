import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/features/profile/presentation/widgets/dialog_and_bottom_sheet_fun/filter_content_bottom_sheet.dart';
import 'package:sinna/core/widgets/custom_option_widget.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.profile.tr(),
          style: AppStyles.textStyle16w400Grey(context),
        ),
        const SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: CustomsBoxDecoration().profileDecoration(context),
          child: Column(
            children: [
              CustomOptionWidget(
                title: LocaleKeys.account_setting.tr(),
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kAccountSettingScreen);
                },
              ),
              CustomDividerWidget(isHeight: false),
              CustomOptionWidget(
                title: LocaleKeys.preferences.tr(),
                onTap: () {
                  filterContentBottomSheet(context);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
