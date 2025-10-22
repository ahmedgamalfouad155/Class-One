import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/theme/styles.dart'; 
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/core/widgets/custom_option_widget.dart';

class AcademicPartnersScetion extends StatelessWidget {
  const AcademicPartnersScetion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Academic Partners",
          style: AppStyles.textStyle16w400Grey(context),
        ),
        const SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: CustomsBoxDecoration().profileDecoration(context),
          child: Column(
            children: [
              CustomOptionWidget(
                title: "Instructors",
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kInstructorScreen);
                },
              ),
              CustomDividerWidget(),
              CustomOptionWidget(
                title: "Institutions",
                onTap: () { 
                  GoRouter.of(context).push(AppRouter.kInstitutionsScreen);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
