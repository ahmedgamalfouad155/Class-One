// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'package:sinna/core/theme/colors.dart'; 
import 'package:sinna/features/profile/presentation/manager/institutions_cubit.dart'; 

class InstitutionsRadioWidget extends StatelessWidget {
  const InstitutionsRadioWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InstitutionsRadioCubit, String?>(
      builder: (context, selected) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Radio<String>(
              value: title,
              groupValue: selected,
              onChanged: (value) {
                if (value != null) {
                  context.read<InstitutionsRadioCubit>().selectTemp(value);
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
