import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart'; 

class CustomFilterItemWidget extends StatelessWidget {
  const CustomFilterItemWidget({
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
              : context.appColors.greyMoonlight,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: AppStyles.textStyle14W600(context).copyWith(
            color: isSelected ? Colors.white : context.appColors.black,
          ),
        ),
      ),
    );
  }
}
