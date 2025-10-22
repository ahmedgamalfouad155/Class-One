import 'package:flutter/material.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/create_course/sellection_instructor_widget.dart';

class TeachingInfoSection extends StatelessWidget {
  const TeachingInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Teaching Info", style: AppStyles.textStyle16w400Grey(context)),
        const SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: CustomsBoxDecoration().profileDecoration(context),
          child: SellectionInstructorWidget(),
        ),
      ],
    );
  }
}
