import 'package:flutter/material.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/theme/styles.dart'; 
import 'package:sinna/core/widgets/custom_option_widget.dart';

class InstitutionsScetion extends StatelessWidget {
  const InstitutionsScetion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Institutions", style: AppStyles.textStyle16w400Grey(context)),
        const SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: CustomsBoxDecoration().profileDecoration(context),
          child: CustomOptionWidget(title: "Institutions", onTap: () {}),
        ),
      ],
    );
  }
}
