import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/institutions/institution_bottom_sheet.dart';

class PopupMenufieldNameAndInstitutionWidget extends StatelessWidget {
  const PopupMenufieldNameAndInstitutionWidget({super.key, required this.specialization});
  final String specialization;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert),
      color: context.appColors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      offset: const Offset(0, 40),
      onSelected: (value) {
        switch (value) {
          case 'edit_field':
            // createCourseBottomSheet(context, coursePathModels, true);
            //
            break;

          case 'add_institution':
            institutionBottomSheet(context, specialization);

            //
            // showDialog(
            //   context: context,
            //   builder: (_) => const AddingInstitutionsDialog(),
            // );
            break;
        }
      },

      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'edit_field',
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            child: const Text('Edit Field', style: TextStyle(fontSize: 14)),
          ),
        ),
        const PopupMenuDivider(height: 1),
        const PopupMenuItem(
          value: 'add_institution',
          child: Text('Add Institution', style: TextStyle(fontSize: 14)),
        ),
      ],
    );
  }
}
