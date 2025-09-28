import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({super.key, this.isHeight = false});
  final bool? isHeight;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: context.appColors.greyNavBar,
      thickness: .5,
      height: isHeight == true ? 30 : 0,
    );
  }
}
