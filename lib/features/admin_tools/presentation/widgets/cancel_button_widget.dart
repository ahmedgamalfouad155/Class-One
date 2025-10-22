
import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/widgets/custom_buton.dart';

class CancelButtonWidget extends StatelessWidget {
  const CancelButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: "Cancel",
      onPressed: () => Navigator.pop(context),
      bacgrouncColor: context.appColors.greyMoonlight,
      textColor: context.appColors.black,
      borderSideColor: context.appColors.greyMoonlight,
    );
  }
}
