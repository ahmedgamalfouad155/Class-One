import 'package:flutter/material.dart'; 
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/core/widgets/custom_option_widget.dart';

class UserManagementSection extends StatelessWidget {
  const UserManagementSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("User Management", style: AppStyles.textStyle16w400Grey(context)),
        const SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: CustomsBoxDecoration().profileDecoration(context),
          child: Column(
            children: [
              CustomOptionWidget(
                title: "Users",
                onTap: () {
                  
                },
              ),
              CustomDividerWidget(),
              CustomOptionWidget(title: "Enrolment", onTap: () {}),
            ],
          ),
        ),
      ],
    );
  }
}
