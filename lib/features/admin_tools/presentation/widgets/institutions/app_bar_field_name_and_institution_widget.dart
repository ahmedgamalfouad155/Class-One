import 'package:flutter/material.dart';
import 'package:sinna/core/helper/normalize_firestore_name.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/institutions/delete_field_icon_widget.dart';
import 'package:sinna/features/course_details/presentation/widget/popup_menu_course_widget.dart';

class AppBarFieldNameAndInstitutionWidget extends StatelessWidget {
  const AppBarFieldNameAndInstitutionWidget({
    super.key,
    required this.fieldName,
  });
  final String fieldName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: context.appColors.black),
        ),
        const SizedBox(width: 10),
        Text(
          denormalizeFirestoreName(fieldName),
          style: AppStyles.textStyle22W600(context),
        ),
        const Spacer(),
        DeleteFieldIconWidget(),
        PopupMenufieldNameAndInstitutionWidget( specialization: fieldName),
      ],
    );
  }
}
