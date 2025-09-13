import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/features/categories/presentation/final/widgets/final_signin_body.dart';

class FinalSigninView extends StatelessWidget {
  const FinalSigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.white,
      body: FinalSigninBody(),
    );
  }
}
