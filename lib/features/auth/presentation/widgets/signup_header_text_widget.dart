import 'package:flutter/widgets.dart';
import 'package:sinna/core/theme/styles.dart';

class SignupHeaderTextWidget extends StatelessWidget {
  const SignupHeaderTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Start with Basic Information",
          style: AppStyles.textStyle32(context),
        ),
        Text(
          "Enter your details to create a new account",
          style: AppStyles.textStyle16w400Grey(context),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
