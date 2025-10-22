import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';

import 'package:sinna/core/widgets/level_radio_widget.dart';
import 'package:sinna/features/profile/presentation/manager/levels_radio_cubit.dart';

void showLevelsDialog(BuildContext context, LevelsRadioCubit cubit) {
  showDialog(
    context: context,
    builder: (_) {
      return BlocProvider.value(
        value: cubit,
        child: AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 0),
          backgroundColor: context.appColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            "Undergraduate",
            style: AppStyles.textStyle20W600(context),
          ),
          content: SizedBox(
            width: context.width / 1.3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                LevelRadioWidget(title: "Year 1"),
                CustomDividerWidget(),
                LevelRadioWidget(title: "Year 2"),
                CustomDividerWidget(),
                LevelRadioWidget(title: "Year 3"),
                CustomDividerWidget(),
                LevelRadioWidget(title: "Year 4"),
                CustomDividerWidget(),
                LevelRadioWidget(title: "Year 5"),
                CustomDividerWidget(),
                LevelRadioWidget(title: "Master’s Degree"),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.read<LevelsRadioCubit>().cancelSelection();
                Navigator.of(context).pop(false);
              },
              child: Text(
                "Cancel",
                style: AppStyles.textStyle16W600(
                  context,
                ).copyWith(color: context.appColors.blue),
              ),
            ),
            TextButton(
              onPressed: () {
                context.read<LevelsRadioCubit>().confirmSelection();
                Navigator.of(context).pop(true);
              },
              child: Text(
                "Confirm",
                style: AppStyles.textStyle16W600(
                  context,
                ).copyWith(color: context.appColors.blue),
              ),
            ),
          ],
        ),
      );
    },
  );
}
