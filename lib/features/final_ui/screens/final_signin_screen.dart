import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/features/final_ui/widgets/final_signin_body.dart';

class FinalSigninScreen extends StatelessWidget {
  const FinalSigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.white,
      body: FinalSigninBody(),
    );
  }
}
