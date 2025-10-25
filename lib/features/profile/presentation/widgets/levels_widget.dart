import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/profile/presentation/manager/levels_radio_cubit.dart';
import 'package:sinna/features/profile/presentation/widgets/dialog_and_bottom_sheet_fun/levels_dialog.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class LevelsWidget extends StatelessWidget {
  const LevelsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<LevelsRadioCubit>(),
      child: BlocBuilder<LevelsRadioCubit, String?>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () =>
                    showLevelsDialog(context, context.read<LevelsRadioCubit>()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.levels.tr(),
                      style: AppStyles.textStyle16w400Grey(
                        context,
                      ).copyWith(color: context.appColors.black),
                    ),
                    Row(
                      children: [
                        Text(
                          state ?? LocaleKeys.select_year.tr(),
                          style: AppStyles.textStyle14W600(context),
                        ),
                        const SizedBox(width: 5),
                        const Icon(Icons.arrow_drop_down_sharp),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
