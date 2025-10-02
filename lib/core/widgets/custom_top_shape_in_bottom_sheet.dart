
import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';

class CustomTopShapeINBottomSheet extends StatelessWidget {
  const CustomTopShapeINBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: context.appColors.greyNavBar,
      ),
    );
  }
}