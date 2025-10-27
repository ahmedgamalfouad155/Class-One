import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/colors.dart'; 
import 'package:sinna/core/theme/styles.dart'; 
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:sinna/features/profile/presentation/widgets/delete_account_dialog_widget.dart';
import 'package:sinna/core/widgets/custom_option_widget.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class OtherSection extends StatelessWidget {
  const OtherSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.other.tr(),
          style: AppStyles.textStyle16w400Grey(context),
        ),

        Column(
          children: [
            CustomOptionWidget(
              title: LocaleKeys.delete_account.tr(),
              color: context.appColors.red,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => const DeleteAccountDialogWidget(),
                );
              },
            ),
            CustomOptionWidget(
              title: LocaleKeys.logout.tr(),
              color: context.appColors.red,
              onTap: () {
                BlocProvider.of<AuthCubit>(context).logout();
                (context).go(AppRouter.klandingScreen);
              },
            ),
          ],
        ),
      ],
    );
  }
}
