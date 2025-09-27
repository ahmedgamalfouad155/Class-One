import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/features/profile/presentation/view/widgets/custom_bottom_sheet.dart';

void appearanceContentBottomSheet(BuildContext context) {
  CustomBottomSheet.show(
    context: context,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 30,
          height: 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: context.appColors.grey,
          ),
        ),
        const SizedBox(height: 10),
        Text("Appearance", style: AppStyles.textStyle16(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("System Default"),
            Radio(
              value: true,
              groupValue: true,
              onChanged: (v) {},
              activeColor: context.appColors.blue,
            ),
          ],
        ),
        CustomDividerWidget(isHeight: false),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Light"),
            Radio(
              value: false,
              groupValue: true,
              onChanged: (v) {},
              fillColor: WidgetStateProperty.resolveWith<Color>((state) {
                return context.appColors.blue;
              }),
            ),
          ],
        ),
        CustomDividerWidget(isHeight: false),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Dark"),
            Radio(
              value: false,
              groupValue: true,
              onChanged: (v) {},
              activeColor: context.appColors.blue,
              fillColor: WidgetStateProperty.resolveWith<Color>((state) {
                return context.appColors.blue;
              }),
            ),
          ],
        ),
        const SizedBox(height: 10),
        CustomButton(text: "Apply", onPressed: () {}),
      ],
    ),
  );
}
