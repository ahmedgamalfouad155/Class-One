import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';

class SellectionInstructorWidget extends StatelessWidget {
  const SellectionInstructorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Text("Instructor", style: AppStyles.textStyle14W600(context)),
            Spacer(),
            Text(
              "Select ",
              style: AppStyles.textStyle14W600(
                context,
              ).copyWith(color: context.appColors.black),
            ),
            const SizedBox(width: 10),
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
