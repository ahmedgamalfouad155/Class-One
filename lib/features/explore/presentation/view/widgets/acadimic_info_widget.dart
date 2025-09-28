import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';

class AcadimicInfoWidget extends StatelessWidget {
  const AcadimicInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Academic Info',
          style: AppStyles.textStyle16W600(
            context,
          ).copyWith(color: context.appColors.grey),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'University',
              style: AppStyles.textStyle16w400Grey(
                context,
              ).copyWith(color: context.appColors.black),
            ),
            Row(
              children: [
                Text(
                  'KKU',
                  style: AppStyles.textStyle16w400Grey(
                    context,
                  ).copyWith(color: context.appColors.black),
                ),
                const SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: context.appColors.greyNavBar,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
