import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/features/profile/presentation/view/widgets/custom_bottom_sheet.dart';

void languageContentBottomSheet(BuildContext context) {
  CustomBottomSheet.show(
    context: context,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 30,
          height: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: context.appColors.grey,
          ),
        ),
        Text("Language", style: AppStyles.textStyle16W600(context)),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("English"),

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
            Text("عربي"),
            Radio(
              value: false,
              groupValue: false,
              onChanged: (v) {},
              activeColor: context.appColors.blue,
            ),
          ],
        ),
        const SizedBox(height: 20),
        CustomButton(text: "Apply", onPressed: () {}),
      ],
    ),
  );
}
