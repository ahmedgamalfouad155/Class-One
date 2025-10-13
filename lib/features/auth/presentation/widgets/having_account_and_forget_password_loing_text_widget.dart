import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';

class HavingAccountAndForgetPasswordLoginTextWidget extends StatelessWidget {
  const HavingAccountAndForgetPasswordLoginTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Row(
        //   children: [
        //     Text(
        //       "Don't have an account?",
        //       style: AppStyles.textStyle14W600(context),
        //     ),
        //     InkWell(
        //       onTap: () {
        //         GoRouter.of(context).push(AppRouter.kSignUpScreen);
        //       },
        //       child: Text(
        //         " Sign Up",
        //         style: AppStyles.textStyle12GreyW400(context).copyWith(
        //           color: context.appColors.blue,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        TextButton(
          onPressed: ()=>GoRouter.of(context).push(AppRouter.kForgetPasswordScreen),
          child: Text(
            "Forgot Password?",
            style: AppStyles.textStyle12GreyW400(context).copyWith(
              color: context.appColors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
