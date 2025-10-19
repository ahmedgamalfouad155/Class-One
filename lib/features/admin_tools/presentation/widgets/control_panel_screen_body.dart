import 'package:flutter/material.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/course_managment_section.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/academic_partners_scetion.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/user_management_section.dart';

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
          CourseManagmentSection(),
          const SizedBox(height: 32),
          AcademicPartnersScetion(),
          const SizedBox(height: 32),
          UserManagementSection(),
        ],
      ),
    );
  }
}
