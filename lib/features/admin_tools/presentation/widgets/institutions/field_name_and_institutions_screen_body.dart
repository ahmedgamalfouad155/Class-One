import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/admin_tools/data/models/field_model.dart';
import 'package:sinna/features/admin_tools/presentation/manager/institutions_cubit/institutions_cubit.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/institutions/app_bar_field_name_and_institution_widget.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/institutions/list_of_institution_widget.dart';

class FieldNameAndInstitutionsScreenBody extends StatelessWidget {
  const FieldNameAndInstitutionsScreenBody({super.key, required this.field});
  final FieldModel field;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBarFieldNameAndInstitutionWidget(field: field),
          const SizedBox(height: 16),
          BlocProvider(
            create: (context) => InstitutionsCubit(),
            child: ListOfInstitutionWidget(specializationId: field.id),
          ),
        ],
      ),
    );
  }
}
