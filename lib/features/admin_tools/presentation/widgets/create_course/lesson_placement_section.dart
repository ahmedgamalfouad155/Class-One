import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_option_widget.dart';

class LessonPlacementSection extends StatelessWidget {
  const LessonPlacementSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Lesson Placement", style: AppStyles.textStyle16w400Grey(context)),
        const SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: CustomsBoxDecoration().profileDecoration(context),
          child: CustomOptionWidget(
            title: "Lesson Placement",
            onTap: () {},
            switchIcon: Transform.scale(
              scale: .8,
              child: Switch(
                value: true,
                onChanged: (val) {},
                activeTrackColor: Colors.green,
                inactiveTrackColor: context.appColors.greyNavBar,
                inactiveThumbColor: context.appColors.white,
                
              ),
            ),
          ),
        ),
      ],
    );
  }
}
