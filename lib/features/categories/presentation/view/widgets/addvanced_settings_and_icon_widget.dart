
import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';

class AddvancedSettingsAndIconWidget extends StatelessWidget {
  const AddvancedSettingsAndIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar( 
          backgroundColor: context.appColors.greyBackgroundTextFiled,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close, color: context.appColors.black),
          ),
        ),
        Text(
          "Advanced Settings",
          style: AppStyles.textStyle16W600(context),
        ),
      ],
    );
  }
}
