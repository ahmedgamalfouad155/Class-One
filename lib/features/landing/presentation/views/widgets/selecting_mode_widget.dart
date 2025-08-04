import 'package:flutter/material.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';

class SelectingModeWidget extends StatelessWidget {
  const SelectingModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = AppMedia.width(context) / 2.5;
    final height = AppMedia.height(context) / 6;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Container(
              width: width,
              height: height,
              decoration: CustomsBoxDecoration().defaultBoxDecoration(
                context,
                color: Colors.black,
              ),
              child: Center(
                child: Text(
                  "Dark Mode",
                  style: AppStyles.textStyle16(
                    context,
                  ).copyWith(color: Colors.white),
                ),
              ),
            ),
            Radio<bool>(value: false, groupValue: true, onChanged: (value) {}),
          ],
        ),
        Column(
          children: [
            Container(
              width: width,
              height: height,
              decoration: CustomsBoxDecoration().defaultBoxDecoration(context),
              child: Center(child: Text("Light Mode")),
            ),
            Radio<bool>(value: true, groupValue: true, onChanged: (value) {}),
          ],
        ),
      ],
    );
  }
}
