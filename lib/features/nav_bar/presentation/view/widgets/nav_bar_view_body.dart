import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/categories/presentation/view/explore_view.dart';
import 'package:sinna/features/my_courses/presentation/view/my_corses_view.dart';
import 'package:sinna/features/nav_bar/presentation/manager/nav_bar_cubit/navbar_cubit.dart';
import 'package:sinna/features/nav_bar/presentation/manager/nav_bar_cubit/navbar_state.dart';
import 'package:sinna/features/notifications/presentation/view/notifications_view.dart';
import 'package:sinna/features/profile/presentation/view/profile_view.dart';

class NavBarViewBody extends StatefulWidget {
  const NavBarViewBody({super.key});

  @override
  State<NavBarViewBody> createState() => _NavBarViewBodyState();
}

class _NavBarViewBodyState extends State<NavBarViewBody> {
  final List<Widget> screen = [
    MyCorsesView(),
    ExploreView(),
    NotificationsView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    final navBarCubit = context.read<NavBarCubit>();

    return BlocBuilder<NavBarCubit, NavBarState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(index: navBarCubit.currentIndex, children: screen),
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
              selectedLabelStyle: AppStyles.textStyle12(
                context,
              ).copyWith(fontWeight: FontWeight.bold),
              unselectedLabelStyle: AppStyles.textStyle12(
                context,
              ).copyWith(fontWeight: FontWeight.bold),
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    navBarCubit.currentIndex == 0
                        ? AppImages.dashBoard2
                        : AppImages.dashBoard1,
                  ),
                  label: "Dashboard",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    navBarCubit.currentIndex == 1
                        ? AppImages.explore2
                        : AppImages.explore1,
                  ),
                  label: "Explore",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    navBarCubit.currentIndex == 2
                        ? AppImages.inBox2
                        : AppImages.inBox1,
                  ),
                  label: "Inbox",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    navBarCubit.currentIndex == 3
                        ? AppImages.you2
                        : AppImages.you1,
                  ),
                  label: "Profile",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
