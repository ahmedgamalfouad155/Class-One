import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/profile/presentation/screen/widgets/profile_screen_body.dart';

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
              child: Icon(Icons.person, color: context.appColors.black),
            ),
            const SizedBox(width: 10),
            Text(
              "Ahmed gamal",
              style: AppStyles.textStyle16W600(
                context,
              ).copyWith(color: context.appColors.black),
            ),
          ],
        ),
      ),
      body: ProfileScreenBody(),
    );
  }
}
