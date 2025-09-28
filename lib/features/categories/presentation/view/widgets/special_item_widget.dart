import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';

class SpecialItemWidget extends StatelessWidget {
  const SpecialItemWidget({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? context.appColors.blue
              : context.appColors.greyBackgroundTextFiled,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          title,
          style: AppStyles.textStyle14(context).copyWith(
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : context.appColors.black,
          ),
        ),
      ),
    );
  }
}
