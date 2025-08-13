import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';

class CustomDropdownWidget extends StatelessWidget {
  final List<String> items;
  final String? selectedValue;
  final String hintText;
  final ValueChanged<String> onChanged;
  final bool enabled;

  const CustomDropdownWidget({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.hintText,
    required this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      focusColor: context.appColors.blue,
      iconEnabledColor: context.appColors.blue,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.appColors.blue, width: 1.5),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.appColors.blue, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onChanged: enabled ? (v) => onChanged(v!) : null,
      items: items
          .map(
            (e) => DropdownMenuItem<String>(
              value: e,
              child: Text(e, style: AppStyles.textStyle18(context)),
            ),
          )
          .toList(),
    );
  }
}
