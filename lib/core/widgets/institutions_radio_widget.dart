// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/features/admin_tools/data/models/institution_model.dart';
import 'package:sinna/features/profile/presentation/manager/institutions_cubit.dart';

class InstitutionsRadioWidget extends StatelessWidget {
  const InstitutionsRadioWidget({super.key, required this.option});

  final InstitutionModel option;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InstitutionsRadioCubit, InstitutionModel?>(
      builder: (context, selected) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(option.name),
            Radio<String>(
              value: option.id,
              groupValue: selected?.id,
              onChanged: (value) {
                if (value != null) {
                  context.read<InstitutionsRadioCubit>().selectTemp(
                    InstitutionModel(id: option.id, name: option.name),
                  );
                }
              },
              activeColor: context.appColors.blue,
            ),
          ],
        );
      },
    );
  }
}
