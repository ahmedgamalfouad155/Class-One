import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_empty_screen.dart';
import 'package:sinna/core/widgets/custom_option_widget.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:sinna/features/profile/presentation/manager/theme_cubit/theme_cubit.dart';
import 'package:sinna/features/profile/presentation/widgets/custom_bottom_sheet.dart';
import 'package:sinna/features/profile/presentation/widgets/title_in_buttom_sheet_widget.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class LogoutOptionWidget extends StatelessWidget {
  const LogoutOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOptionWidget(
      title: LocaleKeys.logout.tr(),
      onTap: () {
        CustomBottomSheet.show(
          context: context,
          child: Column(
            children: [
              TitleInButtomSheetWidget(title: ""),
              CustomEmptyScreen(
                image: context.read<ThemeCubit>().isDark
                    ? AppImages.logoutDark
                    : AppImages.logoutLight,
                title: LocaleKeys.you_are_about_to_log_out.tr(),
                subTitle: LocaleKeys.you_can_sign_back_in_anytime.tr(),
              ),
              const SizedBox(height: 10),
              CustomButton(
                bacgrouncColor: context.appColors.greyMoonlight,
                borderSideColor: context.appColors.greyMoonlight,
                textColor: context.appColors.red,
                text: LocaleKeys.continue_c.tr(),
                onPressed: () {
                  BlocProvider.of<AuthCubit>(context).logout();
                  (context).go(AppRouter.klandingScreen);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
