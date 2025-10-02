import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/cubit/radio_cubit/radio_cubit.dart';
import 'package:sinna/core/theme/colors.dart';

class CustomRadioWidget extends StatelessWidget {
  const CustomRadioWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioCubit, String?>(
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
                  context.read<RadioCubit>().selectTemp(value);
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
