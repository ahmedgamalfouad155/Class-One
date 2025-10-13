import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:sinna/features/profile/presentation/widgets/addmin_section.dart';
import 'package:sinna/features/profile/presentation/widgets/other_section.dart';
import 'package:sinna/features/profile/presentation/widgets/profile_section.dart';
import 'package:sinna/features/profile/presentation/widgets/setting_section.dart';
import 'package:sinna/features/profile/presentation/widgets/support_section.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isAdmin = context.read<AuthCubit>().emailAdmin;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // isAdmin
            //     ? ProfileOptionWidget(
            //         title: 'Admin Control Users Courses',
            //         icon: MaterialCommunityIcons.controller_classic_outline,
            //         onTap: () {
            //           GoRouter.of(context).push(AppRouter.kControlPanal);
            //         },
            //       )
            //     : SizedBox(),
            // isAdmin ? CustomDividerWidget() : SizedBox(),
            ProfileSection(),
            const SizedBox(height: 30),
            SettingSection(),
            const SizedBox(height: 30),
            SupportSection(),
            const SizedBox(height: 30),
            isAdmin ? AddminSection() : SizedBox(),
            SizedBox(height: isAdmin ? 30 : 0),
            OtherSection(),
          ],
        ),
      ),
    );
  }
}
