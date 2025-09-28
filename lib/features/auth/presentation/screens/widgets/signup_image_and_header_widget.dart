import 'package:flutter/widgets.dart';
import 'package:sinna/core/theme/styles.dart';

class SignupImageAndHeaderWidget extends StatelessWidget {
  const SignupImageAndHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image.asset(AppImages.logo, height: 100),
        const SizedBox(height: 20),
        Text("Welcom", style: AppStyles.textStyle18Bold(context)),
        Text(
          "Please enter your details.",
          style: AppStyles.textStyle14W600(context),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
