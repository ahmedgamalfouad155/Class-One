import 'package:flutter/material.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/institutions/field_name_and_institutions_screen_body.dart';

class FieldNameAndInstitutionsScreen extends StatelessWidget {
  const FieldNameAndInstitutionsScreen({
    super.key,
    required this.specialization,
  });
  final String specialization;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FieldNameAndInstitutionsScreenBody(fieldName: specialization),
      ),
    );
  }
}
