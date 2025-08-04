import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';

class FinishingSignup extends StatelessWidget {
  const FinishingSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(AppImages.logo, height: 100),
                const SizedBox(height: 10),
                Text(
                  "Country",
                  style: AppStyles.textStyle14(
                    context,
                  ).copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 5),
                CustomTextFieldWidget(
                  hintText: "Choose your country",
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 10),
                Text(
                  "University",
                  style: AppStyles.textStyle14(
                    context,
                  ).copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 5),
                CustomTextFieldWidget(
                  hintText: "Choose your university",
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 10),
                Text(
                  "System",
                  style: AppStyles.textStyle14(
                    context,
                  ).copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 5),
                CustomTextFieldWidget(
                  hintText: "Choose your system",
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 10),
                Text(
                  "Levels",
                  style: AppStyles.textStyle14(
                    context,
                  ).copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 5),
                CustomTextFieldWidget(
                  hintText: "Choose your levels",
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 10),
                CustomButon(text: "Singup", onPressed: () {
                  GoRouter.of(context).push(AppRouter.kNavBarView);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
