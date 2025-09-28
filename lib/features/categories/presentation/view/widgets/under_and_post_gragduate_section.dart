import 'package:flutter/material.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/features/categories/presentation/view/widgets/custom_check_box.dart';

class UnderAndPostGraduateSection extends StatelessWidget {
  const UnderAndPostGraduateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Undergraduate", style: AppStyles.textStyle16W600Grey(context)),
        CustomCheckBox(title: 'First', value: true),
        CustomDividerWidget(),
        CustomCheckBox(title: 'Second'),
        CustomDividerWidget(),
        CustomCheckBox(title: 'Third'),
        CustomDividerWidget(),
        CustomCheckBox(title: 'Fourth'),
        CustomDividerWidget(),
        CustomCheckBox(title: 'Fifth'),
        Text("Postgraduate", style: AppStyles.textStyle16W600Grey(context)),
        CustomCheckBox(title: 'Master’s Degree'),
      ],
    );
  }
}
