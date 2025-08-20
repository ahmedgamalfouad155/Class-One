import 'package:flutter/material.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/features/profile/presentation/view/widgets/selecting_mode_widget.dart';

class ModeViewBody extends StatelessWidget {
  const ModeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Image.asset(
              AppImages.logo,
              width: AppMedia.width(context) / 2,
            ),
          ),
          const SizedBox(height: 50),
          Expanded(
            child: Container(
              width: AppMedia.width(context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: context.appColors.white,
              ),
              child: SelectingModeWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
