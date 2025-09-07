import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:sinna/features/profile/presentation/view/widgets/delete_account_option_widget.dart';
import 'package:sinna/features/profile/presentation/view/widgets/profile_option_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isAdmin = context.read<AuthCubit>().emailAdmin;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          isAdmin
              ? ProfileOptionWidget(
                  title: 'Admin Control Users Courses',
                  icon: MaterialCommunityIcons.controller_classic_outline,
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kControlPanal);
                  },
                )
              : SizedBox(),
          isAdmin ? CustomDividerWidget() : SizedBox(),
          ProfileOptionWidget(
            title: 'Account',
            icon: MaterialCommunityIcons.account_alert_outline,
            onTap: () {
              GoRouter.of(context).push(AppRouter.kAccountView);
            },
          ),
          CustomDividerWidget(),
          ProfileOptionWidget(
            title: 'Language',
            icon: FontAwesome.language,
            onTap: () {
              GoRouter.of(context).push(AppRouter.kLanguageView);
            },
          ),
          CustomDividerWidget(),
          ProfileOptionWidget(
            title: 'Appearance',
            icon: MaterialCommunityIcons.theme_light_dark,
            onTap: () {
              GoRouter.of(context).push(AppRouter.kModeView);
            },
          ),
          CustomDividerWidget(),
          ProfileOptionWidget(
            title: 'Contact with support',
            icon: MaterialCommunityIcons.whatsapp,
            onTap: _openWhatsApp,
            color: Colors.green,
          ),
          CustomDividerWidget(),
          DeleteAccountOptionWidget(),
          CustomDividerWidget(),
          ProfileOptionWidget(
            title: 'Logout',
            icon: SimpleLineIcons.logout,
            color: Colors.red,
            onTap: () {
              BlocProvider.of<AuthCubit>(context).logout();
              (context).go(AppRouter.kLogInView);
            },
          ),
        ],
      ),
    );
  }
}

Future<void> _openWhatsApp() async {
  final url = Uri.parse(
    "https://wa.me/${201552569256}?text=${Uri.encodeComponent("test")}",
  );

  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    throw "Could not launch $url";
  }
}
