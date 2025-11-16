import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/widgets/custom_option_widget.dart';
import 'package:sinna/features/course_details/presentation/manager/term_switch_cubit.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class SecondSemesterSection extends StatelessWidget {
  const SecondSemesterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TermSwitcherCubit, bool>(
      builder: (context, isSecondTerm) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: CustomsBoxDecoration().profileDecoration(context),
          child: CustomOptionWidget(
            title: LocaleKeys.second_term.tr(),
            verticalPading: 0,
            onTap: () {},
            switchIcon: Transform.scale(
              scale: .7,
              child: Switch(
                value: isSecondTerm,
                onChanged: (val) {
                  context.read<TermSwitcherCubit>().toggle(val);
                },
                activeTrackColor: Colors.green,
                inactiveTrackColor: context.appColors.greyNavBar,
                inactiveThumbColor: context.appColors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
