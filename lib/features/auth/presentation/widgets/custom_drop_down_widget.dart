import 'package:flutter/material.dart';

class CustomDropdownWidget extends StatelessWidget {
  final String? selectedValue;
  final List<String> items;
  final String hintText;
  final Function(String?) onChanged;
  final bool isEnabled;

  const CustomDropdownWidget({
    super.key,
    required this.selectedValue,
    required this.items,
    required this.hintText,
    required this.onChanged,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    // حذف أي تكرار
    final uniqueItems = items.toSet().toList();

    // لو selectedValue مش موجودة في الليست → null
    final safeValue =
        (selectedValue != null && uniqueItems.contains(selectedValue))
        ? selectedValue
        : null;

    return DropdownButtonFormField<String>(
      initialValue:  safeValue ,
      hint: Text(hintText),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      items: uniqueItems.map((item) {
        return DropdownMenuItem(value: item, child: Text(item));
      }).toList(),
      onChanged: isEnabled ? onChanged : null,
    );
  }
}
