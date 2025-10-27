import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/explore/presentation/screens/explore_screen.dart';
import 'package:sinna/features/my_courses/presentation/screens/my_corses_screen.dart';
import 'package:sinna/features/nav_bar/presentation/manager/nav_bar_cubit/navbar_cubit.dart';
import 'package:sinna/features/nav_bar/presentation/manager/nav_bar_cubit/navbar_state.dart';
import 'package:sinna/features/profile/presentation/manager/theme_cubit/theme_cubit.dart';
import 'package:sinna/features/profile/presentation/screen/profile_screen.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class NavBarScreenBody extends StatefulWidget {
  const NavBarScreenBody({super.key});

  @override
  State<NavBarScreenBody> createState() => _NavBarScreenBodyState();
}

class _NavBarScreenBodyState extends State<NavBarScreenBody> {
  final List<Widget> screen = [
    MyCorsesScreen(),
    ExploreScreen(),
    // NotificationsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final navBarCubit = context.read<NavBarCubit>();

    return BlocBuilder<NavBarCubit, NavBarState>(
      builder: (context, state) {
        return BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeState) {
            return Scaffold(
              body: IndexedStack(
                index: navBarCubit.currentIndex,
                children: screen,
              ),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  color: context.appColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                ),
                child: BottomNavigationBar(
                  onTap: (index) => navBarCubit.changeIndex(index),
                  currentIndex: navBarCubit.currentIndex,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: context.appColors.white,
                  elevation: 0,
                  selectedItemColor: context.appColors.blue,
                  unselectedItemColor: context.appColors.greyNavBar,
                  selectedLabelStyle: AppStyles.textStyle12GreyW400(
                    context,
                  ).copyWith(fontWeight: FontWeight.bold),
                  unselectedLabelStyle: AppStyles.textStyle12GreyW400(
                    context,
                  ).copyWith(fontWeight: FontWeight.bold),
                  items: [
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        navBarCubit.currentIndex == 0
                            ? AppImages.dashBoard2
                            : themeState == ThemeMode.dark
                            ? AppImages.dashBoard3
                            : AppImages.dashBoard1,
                      ),
                      label: LocaleKeys.dashboard.tr(),
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        navBarCubit.currentIndex == 1
                            ? AppImages.explore2
                            : themeState == ThemeMode.dark
                            ? AppImages.explore3
                            : AppImages.explore1,
                      ),
                      label: LocaleKeys.explore.tr(),
                    ),
                    // BottomNavigationBarItem(
                    //   icon: SvgPicture.asset(
                    //     navBarCubit.currentIndex == 2
                    //         ? AppImages.inBox2
                    //         : themeState == ThemeMode.dark
                    //         ? AppImages.dashBoard3
                    //         : AppImages.inBox1,
                    //   ),
                    //   label: LocaleKeys.inbox.tr(),
                    // ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        navBarCubit.currentIndex == 2
                            ? AppImages.you2
                            : themeState == ThemeMode.dark
                            ? AppImages.you3
                            : AppImages.you1,
                      ),
                      label: LocaleKeys.profile.tr(),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
