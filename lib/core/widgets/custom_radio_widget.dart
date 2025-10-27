// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/cubit/radio_cubit/radio_cubit.dart';
import 'package:sinna/core/theme/colors.dart';

class CustomRadioWidget extends StatelessWidget {
  const CustomRadioWidget({
    super.key,
    required this.title,
    this.value,
  });

  final String title;
  final String? value; 

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioCubit, String?>(
      builder: (context, selected) {
        final currentValue = value ?? title; 

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Radio<String>(
              value: currentValue,
              groupValue: selected,
              onChanged: (val) {
                if (val != null) {
                  context.read<RadioCubit>().selectTemp(val);
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
