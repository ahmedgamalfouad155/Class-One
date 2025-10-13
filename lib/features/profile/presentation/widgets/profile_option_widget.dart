import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';

class ProfileOptionWidget extends StatelessWidget {
  const ProfileOptionWidget({
    super.key,
    required this.title,
    this.widget,
    required this.onTap,
    this.verticalPading,
    this.color,
  });
  final String title;
  final Widget? widget;
  final VoidCallback? onTap;
  final double? verticalPading;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPading ?? 10),
        child: Row(
          children: [
            Text(
              title,
              style: AppStyles.textStyle14W600(
                context,
              ).copyWith(color: color ?? context.appColors.black),
            ),
            Spacer(),
            widget ??
                Icon(
                  Icons.arrow_forward_ios,
                  color: context.appColors.black,
                  size: 12,
                ),
          ],
        ),
      ),
    );
  }
}
