import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/colors.dart'; 
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_option_widget.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class AddminSection extends StatelessWidget {
  const AddminSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.addmin_tools.tr(),
          style: AppStyles.textStyle16w400Grey(context),
        ), 
        CustomOptionWidget(
          title: LocaleKeys.control_panel.tr(),
          color: context.appColors.blue,
          onTap: () {
            GoRouter.of(context).push(AppRouter.kControlPanalScreen);
          },
        ),
      ],
    );
  }
}
