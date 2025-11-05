
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';

class CustomProfileAvatar extends StatelessWidget {
  const CustomProfileAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 18.r,
      
      backgroundColor: context.appColors.blue,
      child: Text(
        "A",
        style: AppStyles.textStyle16W600(
          context,
        ).copyWith(color: context.appColors.white),
      ),
    );
  }
}
