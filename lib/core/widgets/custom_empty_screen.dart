import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';

class CustomEmptyScreen extends StatelessWidget {
  const CustomEmptyScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    this.width,
    this.height,
  });
  final String image, title, subTitle;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.width,
      height: height ?? context.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          const SizedBox(height: 16),
          Text(
            title,
            style: AppStyles.textStyle22W600(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            subTitle,
            style: AppStyles.textStyle22W600(
              context,
            ).copyWith(color: context.appColors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
