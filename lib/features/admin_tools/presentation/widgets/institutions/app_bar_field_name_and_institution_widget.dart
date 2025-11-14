import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/admin_tools/data/models/field_model.dart';
import 'package:sinna/features/course_details/presentation/widget/popup_menu_course_widget.dart';

class AppBarFieldNameAndInstitutionWidget extends StatelessWidget {
  const AppBarFieldNameAndInstitutionWidget({super.key, required this.field});
  final FieldModel field;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: context.appColors.black),
        ),
        const SizedBox(width: 10),
        Text(field.name, style: AppStyles.textStyle22W600(context)),
        const Spacer(),
        PopupMenufieldNameAndInstitutionWidget(field: field),
      ],
    );
  }
}
