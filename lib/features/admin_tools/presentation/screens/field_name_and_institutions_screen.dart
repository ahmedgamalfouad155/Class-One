import 'package:flutter/material.dart';
import 'package:sinna/features/admin_tools/data/models/field_model.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/institutions/field_name_and_institutions_screen_body.dart';

class FieldNameAndInstitutionsScreen extends StatelessWidget {
  const FieldNameAndInstitutionsScreen({super.key, required this.fieldModel});
  final FieldModel fieldModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FieldNameAndInstitutionsScreenBody(field: fieldModel),
      ),
    );
  }
}
