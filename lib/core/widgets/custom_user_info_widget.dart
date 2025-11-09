
import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_profile_avatar.dart';

class CustomUserInfoWidget extends StatelessWidget {
  const CustomUserInfoWidget({
    super.key,
    required this.name,
    required this.email,
  });
  final String name, email;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomProfileAvatar(),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,

              style: AppStyles.textStyle16W600(
                context,
              ).copyWith(color: context.appColors.black),
            ),
            Text(email, style: AppStyles.textStyle15W400Grey(context)),
          ],
        ),
      ],
    );
  }
}
