import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';

class CustomOptionWidget extends StatelessWidget {
  const CustomOptionWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.verticalPading,
    this.color,
    this.icon,
    this.switchIcon,
  });
  final String title;
  final VoidCallback? onTap;
  final double? verticalPading;
  final Color? color;
  final Widget? icon, switchIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPading ?? 10),
        child: Row(
          children: [
            icon ?? const SizedBox(),
            icon != null ? const SizedBox(width: 10) : const SizedBox(),
            Expanded(
              child: Text(
                title,
                style: AppStyles.textStyle14W600(
                  context,
                ).copyWith(color: color ?? context.appColors.black),
              ),
            ),
            switchIcon ??
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
