import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_option_widget.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class ControlPanelScreenBody extends StatelessWidget {
  const ControlPanelScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.control_panel.tr(),
            style: AppStyles.textStyle24W600(context),
          ),
          const SizedBox(height: 16),
          CustomOptionWidget(title: LocaleKeys.phone.tr(), onTap: () {}),
          CustomOptionWidget(
            title: LocaleKeys.fields.tr(),
            onTap: () {
              GoRouter.of(context).push(AppRouter.kFildsScreen);
            },
          ),

          CustomOptionWidget(
            title: LocaleKeys.instructors.tr(),
            onTap: () {
              GoRouter.of(context).push(AppRouter.kInstructorScreen);
            },
          ),
          CustomOptionWidget(
            title: LocaleKeys.participants.tr(),
            onTap: () {
              GoRouter.of(context).push(AppRouter.kParticipantsScreen);
            },
          ),
          CustomOptionWidget(
            title: LocaleKeys.admins.tr(),
            onTap: () {
              GoRouter.of(context).push(AppRouter.kAdminsScreen);
            },
          ),
        ],
      ),
    );
  }
}
