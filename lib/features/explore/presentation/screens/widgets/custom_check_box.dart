import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final bool value;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: AppStyles.textStyle16w400Grey(
              context,
            ).copyWith(color: context.appColors.black),
          ),
        ),
        Checkbox(
          value: value,
          onChanged: onChanged, // 👈 اتوصلت بالكيوبيت
          activeColor: context.appColors.blue,
          side: const BorderSide(color: Colors.blue, width: 2),
        ),
      ],
    );
  }
}
