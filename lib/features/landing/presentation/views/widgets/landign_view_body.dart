import 'package:flutter/material.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/widgets/custom_buton.dart';

class LandignViewBody extends StatelessWidget {
  const LandignViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.logo),
          const SizedBox(height: 20),
          CustomButon(text: "Login", onPressed: () {}),
          const SizedBox(height: 20),
          CustomButon(
            text: "Sign up",
            onPressed: () {},
            bacgrouncColor: context.appColors.offWhite,
            textColor: context.appColors.blue,
          ),
        ],
      ),
    );
  }
}
