// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/features/profile/presentation/manager/levels_radio_cubit.dart';

class LevelRadioWidget extends StatelessWidget {
  const LevelRadioWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LevelsRadioCubit, String?>(
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
                  context.read<LevelsRadioCubit>().selectTemp(value);
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
