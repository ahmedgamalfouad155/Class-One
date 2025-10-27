import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:sinna/features/profile/presentation/widgets/addmin_section.dart';
import 'package:sinna/features/profile/presentation/widgets/other_section.dart';
import 'package:sinna/features/profile/presentation/widgets/account_section.dart';
import 'package:sinna/features/profile/presentation/widgets/setting_section.dart';
import 'package:sinna/features/profile/presentation/widgets/help_section.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isAdmin = context.read<AuthCubit>().emailAdmin;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
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
            AccountSection(),
            SizedBox(height: 20.h),
            SettingSection(),
            SizedBox(height: 20.h),
            HelpSection(),
            SizedBox(height: 20.h),
            isAdmin ? AddminSection() : SizedBox(),
            SizedBox(height: isAdmin ? 20.h : 0),
            OtherSection(),
          ],
        ),
      ),
    );
  }
} 
