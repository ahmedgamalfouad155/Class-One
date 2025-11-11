import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_option_widget.dart';

class ControlPanelScreenBody extends StatelessWidget {
  const ControlPanelScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Control Panel", style: AppStyles.textStyle24W600(context)),
          const SizedBox(height: 16),
          CustomOptionWidget(title: "phone", onTap: () {}),
          CustomOptionWidget(
            title: "Fields",
            onTap: () {
              GoRouter.of(context).push(AppRouter.kFildsScreen);
            },
          ),

          CustomOptionWidget(
            title: "Instructors",
            onTap: () {
              GoRouter.of(context).push(AppRouter.kInstructorScreen);
            },
          ),
          CustomOptionWidget(
            title: "Institutions",
            onTap: () {
              GoRouter.of(context).push(AppRouter.kInstitutionsScreen);
            },
          ),
          CustomOptionWidget(
            title: "Participants",
            onTap: () {
              GoRouter.of(context).push(AppRouter.kParticipantsScreen);
            },
          ),
          CustomOptionWidget(
            title: "Admins",
            onTap: () {
              GoRouter.of(context).push(AppRouter.kAdminsScreen);
            },
          ),
        ],
      ),
    );
  }
}
