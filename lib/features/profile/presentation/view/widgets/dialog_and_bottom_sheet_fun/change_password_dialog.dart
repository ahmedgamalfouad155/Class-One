
import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';

void showChangePasswordDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 12),
        backgroundColor: context.appColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text("Password Required", style: AppStyles.textStyle20(context)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Please enter your password to update email or password.",
              style: AppStyles.textStyle16w400Grey(context),
            ),
            const SizedBox(height: 20),
            CustomTextFieldWidget(hintText: ""),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Cancel
            },
            child: Text(
              "Cancel",
              style: AppStyles.textStyle16(
                context,
              ).copyWith(color: context.appColors.blue),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Cancel
            },
            child: Text(
              "Confirm",
              style: AppStyles.textStyle16(
                context,
              ).copyWith(color: context.appColors.blue),
            ),
          ),
        ],
      );
    },
  );
}
