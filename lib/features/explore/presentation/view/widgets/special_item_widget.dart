import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/explore/presentation/view/widgets/list_of_specialt_items_widget.dart';

class SpecialItemWidget extends StatelessWidget {
  const SpecialItemWidget({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.layoutType = SpecialLayoutType.wrap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final SpecialLayoutType layoutType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? context.appColors.blue
              : layoutType == SpecialLayoutType.wrap
              ? context.appColors.greyBackgroundTextFiled
              : context.appColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? context.appColors.blue
                : layoutType == SpecialLayoutType.wrap
                ? context.appColors.greyBackgroundTextFiled
                : context.appColors.greyNavBar,
            width: 1,
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: AppStyles.textStyle14W600(context).copyWith(
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : context.appColors.black,
          ),
        ),
      ),
    );
  }
}
