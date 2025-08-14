import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:sinna/features/profile/presentation/view/widgets/image_profile_section_widget.dart';
import 'package:sinna/features/profile/presentation/view/widgets/profile_option_widget.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageProfileSectionWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileOptionWidget(
                  title: 'Language',
                  icon: FontAwesome.language,
                  onTap: () {},
                ),
                CustomDividerWidget(),
                ProfileOptionWidget(
                  title: 'Mode',
                  icon: MaterialCommunityIcons.theme_light_dark,
                  onTap: () {},
                ),
                CustomDividerWidget(),
                ProfileOptionWidget(
                  title: 'Contact with support',
                  icon: MaterialCommunityIcons.whatsapp,
                  onTap: () {},
                  color: Colors.green,
                ),
                CustomDividerWidget(),
                ProfileOptionWidget(
                  title: 'Delete account',
                  icon: MaterialCommunityIcons.delete_sweep,
                  onTap: () async {
                    await FirebaseAuth.instance.currentUser!.delete();
                    // ignore: use_build_context_synchronously
                    (context).go(AppRouter.kLogInView);
                  },
                  color: Colors.red,
                ),
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
          ),
        ],
      ),
    );
  }
}
