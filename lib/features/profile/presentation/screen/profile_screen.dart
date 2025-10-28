import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/profile/presentation/widgets/profile_screen_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 18.r,
              backgroundColor: context.appColors.blue,
              child: Text(
                "A",
                style: AppStyles.textStyle16W600(
                  context,
                ).copyWith(color: context.appColors.white),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ahmed gamal",
                  style: AppStyles.textStyle16W600(
                    context,
                  ).copyWith(color: context.appColors.black),
                ),
                Text(
                  "amina.kareem@icloud.com",
                  style: AppStyles.textStyle15W400Grey(context),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ProfileScreenBody(),
    );
  }
}
