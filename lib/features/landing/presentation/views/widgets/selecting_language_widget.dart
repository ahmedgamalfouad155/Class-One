import 'package:flutter/material.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/utils/app_media.dart';

class SelectingLanguageWidget extends StatelessWidget {
  const SelectingLanguageWidget({super.key});

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
              decoration: CustomsBoxDecoration().defaultBoxDecoration(context),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(AppImages.egypt, fit: BoxFit.cover),
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(AppImages.usa, fit: BoxFit.cover),
              ),
            ),
            Radio<bool>(value: true, groupValue: true, onChanged: (value) {}),
          ],
        ),
      ],
    );
  }
}
