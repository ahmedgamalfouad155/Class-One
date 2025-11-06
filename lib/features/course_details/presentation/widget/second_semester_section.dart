import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/widgets/custom_option_widget.dart';

class SecondSemesterSection extends StatelessWidget {
  const SecondSemesterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: CustomsBoxDecoration().profileDecoration(context),
          child: CustomOptionWidget(
            title: "Second Semester",
            verticalPading: 0,
            onTap: () {},
            switchIcon: Transform.scale(
              scale: .7,
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
