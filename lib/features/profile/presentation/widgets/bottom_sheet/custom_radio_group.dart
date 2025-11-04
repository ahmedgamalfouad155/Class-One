import 'package:flutter/material.dart'; 
import 'package:sinna/core/helper/normalize_firestore_name.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/core/widgets/custom_radio_widget.dart';

class CustomRadioGroup extends StatelessWidget {
  final List<String> options;

  const CustomRadioGroup({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(options.length, (index) {
        final option = options[index];
        return Column(
          children: [
            CustomRadioWidget(title: denormalizeFirestoreName(option)), 
            if (index != options.length - 1) const CustomDividerWidget(), 
          ],
        );
      }),
    );
  }
}
