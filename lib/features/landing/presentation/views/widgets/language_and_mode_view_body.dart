import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/default_button_widget.dart';
import 'package:sinna/features/landing/presentation/views/widgets/selecting_language_widget.dart';
import 'package:sinna/features/landing/presentation/views/widgets/selecting_mode_widget.dart';

class LanguageAndModeViewBody extends StatelessWidget {
  const LanguageAndModeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                AppImages.logo,
                height: AppMedia.height(context) / 4,
              ),
            ),
            const SizedBox(height: 20),
            Text('Select Language', style: AppStyles.textStyle22(context)),
            const SizedBox(height: 10),
            const SelectingLanguageWidget(),
            Text('Select Mode', style: AppStyles.textStyle22(context)),
            const SizedBox(height: 10),
            SelectingModeWidget(),
            const SizedBox(height: 10),
            Center(
              child: DefaultButtonWidget(
                text: "Next",
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.klandingView);
                },
                width: AppMedia.width(context) / 1.7,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
