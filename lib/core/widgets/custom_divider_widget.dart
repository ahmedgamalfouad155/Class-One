
import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(color: context.appColors.grey, thickness: .5);
  }
}
