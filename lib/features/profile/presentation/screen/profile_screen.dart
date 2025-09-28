import 'package:flutter/material.dart';
import 'package:sinna/core/constants/images.dart';
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
            CircleAvatar(backgroundImage: AssetImage(AppImages.avatar)),
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
