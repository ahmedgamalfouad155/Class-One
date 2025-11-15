import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart'; 
import 'package:sinna/core/helper/open_whatsapp.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/widgets/custom_option_widget.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:sinna/features/profile/presentation/widgets/dialog_and_bottom_sheet_fun/appearance_content_bottom_sheet.dart';
import 'package:sinna/features/profile/presentation/widgets/dialog_and_bottom_sheet_fun/language_content_bottom_sheet.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class YouScreenBody extends StatelessWidget {
  const YouScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                GoRouter.of(context).push(AppRouter.kPreferencesScreen);
              },
            ),
            CustomOptionWidget(
              title: LocaleKeys.language.tr(),
              onTap: () => languageContentBottomSheet(context),
            ),
            CustomOptionWidget(
              title: LocaleKeys.theme.tr(),
              onTap: () => appearanceContentBottomSheet(context),
            ),
            CustomOptionWidget(
              title: LocaleKeys.help_center.tr(),
              onTap: openWhatsApp,
            ),
            CustomOptionWidget(
              title: LocaleKeys.logout.tr(),
              onTap: () {
                BlocProvider.of<AuthCubit>(context).logout();
                (context).go(AppRouter.klandingScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
