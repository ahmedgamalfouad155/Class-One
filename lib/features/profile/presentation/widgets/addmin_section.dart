import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_option_widget.dart';

class AddminSection extends StatelessWidget {
  const AddminSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Admin Tools", style: AppStyles.textStyle16w400Grey(context)),
        const SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: CustomsBoxDecoration().profileDecoration(context),
          child: CustomOptionWidget(
            title: "Control Panel",
            color: context.appColors.blue,
            onTap: () {
              GoRouter.of(context).push(AppRouter.kControlPanalScreen);
            },
          ),
        ),
      ],
    );
  }
}
