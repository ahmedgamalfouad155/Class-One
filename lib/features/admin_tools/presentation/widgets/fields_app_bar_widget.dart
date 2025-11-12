import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/fields_buttom_sheet_widget.dart';

class FieldsAppBarWidget extends StatelessWidget {
  const FieldsAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: context.appColors.black),
        ),
        IconButton(
          onPressed: () => fieldsBottomSheet(context),
          icon: Icon(Icons.add, color: context.appColors.black),
        ),
      ],
    );
  }
}
