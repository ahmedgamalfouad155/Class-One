import 'package:flutter/material.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_buton.dart';

class SelectingModeWidget extends StatelessWidget {
  const SelectingModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = AppMedia.width(context) / 2.5;
    final height = AppMedia.height(context) / 4;

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Select Your Appearance', style: AppStyles.textStyle18(context)),
          Row(
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
                        style: AppStyles.textStyle18(
                          context,
                        ).copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  Radio<bool>(
                    value: false,
                    groupValue: true,
                    onChanged: (value) {},
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: width,
                    height: height,
                    decoration: CustomsBoxDecoration().defaultBoxDecoration(
                      context,
                    ),
                    child: Center(
                      child: Text(
                        "Light Mode",
                        style: AppStyles.textStyle18(context),
                      ),
                    ),
                  ),
                  Radio<bool>(
                    value: true,
                    groupValue: true,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ],
          ),
          CustomButton(
            text: "Change",
            onPressed: () {},
            width: AppMedia.width(context) / 2,
          ),
        ],
      ),
    );
  }
}
