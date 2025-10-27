import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_option_widget.dart';

class AccountScreenBody extends StatelessWidget {
  const AccountScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Profile", style: AppStyles.textStyle24W600(context)),
          SizedBox(height: 20.h),
          CustomOptionWidget(
            title: "Name",
            onTap: () {
              GoRouter.of(context).push(AppRouter.kNameScreen);
            },
          ),
          SizedBox(height: 10.h),
          CustomOptionWidget(
            title: "Password",
            onTap: () {
              GoRouter.of(context).push(AppRouter.kPasswordScreen);
            },
          ),
        ],
      ),
    );
  }
}
