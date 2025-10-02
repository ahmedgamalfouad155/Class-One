import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/features/explore/presentation/manager/chekbox_cubit/check_box_cubit.dart';
import 'package:sinna/features/explore/presentation/screens/widgets/custom_check_box.dart';

class UnderAndPostGraduateSection extends StatelessWidget {
  const UnderAndPostGraduateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckBoxCubit, Map<String, bool>>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Undergraduate",
              style: AppStyles.textStyle16W600Grey(context),
            ),
            CustomCheckBox(
              title: 'First',
              value: state['First'] ?? false,
              onChanged: (v) => context.read<CheckBoxCubit>().toggleCheckBox(
                'First',
                v ?? false,
              ),
            ),
            CustomDividerWidget(),
            CustomCheckBox(
              title: 'Second',
              value: state['Second'] ?? false,
              onChanged: (v) => context.read<CheckBoxCubit>().toggleCheckBox(
                'Second',
                v ?? false,
              ),
            ),
            CustomDividerWidget(),
            CustomCheckBox(
              title: 'Third',
              value: state['Third'] ?? false,
              onChanged: (v) => context.read<CheckBoxCubit>().toggleCheckBox(
                'Third',
                v ?? false,
              ),
            ),
            CustomDividerWidget(),
            CustomCheckBox(
              title: 'Fourth',
              value: state['Fourth'] ?? false,
              onChanged: (v) => context.read<CheckBoxCubit>().toggleCheckBox(
                'Fourth',
                v ?? false,
              ),
            ),
            CustomDividerWidget(),
            CustomCheckBox(
              title: 'Fifth',
              value: state['Fifth'] ?? false,
              onChanged: (v) => context.read<CheckBoxCubit>().toggleCheckBox(
                'Fifth',
                v ?? false,
              ),
            ),
            Text("Postgraduate", style: AppStyles.textStyle16W600Grey(context)),
            CustomCheckBox(
              title: 'Master’s Degree',
              value: state['Master’s Degree'] ?? false,
              onChanged: (v) => context.read<CheckBoxCubit>().toggleCheckBox(
                'Master’s Degree',
                v ?? false,
              ),
            ),
          ],
        );
      },
    );
  }
}
