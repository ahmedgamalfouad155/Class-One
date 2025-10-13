import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';

class ForgetPasswordScreenBody extends StatelessWidget {
  const ForgetPasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 20.0,
        left: 20.0,
        top: context.height / 7,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Reset Password", style: AppStyles.textStyle32(context)),
            const SizedBox(height: 10),
            Text(
              "Enter your registered email, and we’ll send a reset link to your inbox",
              style: AppStyles.textStyle14W600(
                context,
              ).copyWith(color: context.appColors.grey),
            ),
            const SizedBox(height: 30),
            Text("Email", style: AppStyles.textStyle16W600Grey(context)),
            const SizedBox(height: 5),
            CustomTextFieldWidget(hintText: "email@domain.com"),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: CustomButton(
                text: "Sent",
                onPressed: () {},
                width: context.width / 4,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
