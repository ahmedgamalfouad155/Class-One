import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/cubit/radio_cubit/radio_cubit.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/core/widgets/custom_radio_widget.dart';
import 'package:sinna/core/widgets/custom_top_shape_in_bottom_sheet.dart';
import 'package:sinna/features/profile/presentation/manager/theme_cubit/theme_cubit.dart';
import 'package:sinna/features/profile/presentation/widgets/custom_bottom_sheet.dart';
import 'package:sinna/generated/locale_keys.g.dart';

void appearanceContentBottomSheet(BuildContext context) {
  final isDark = context.read<ThemeCubit>().isDark;

  CustomBottomSheet.show(
    context: context,
    child: BlocProvider(
      create: (_) => RadioCubit(initialValue: isDark ? "Dark" : "Light"),
      child: Builder(
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomTopShapeINBottomSheet(),
              const SizedBox(height: 10),
              Text(
                LocaleKeys.appearance.tr(),
                style: AppStyles.textStyle16W600(context),
              ),

              // Light Option
              CustomRadioWidget(title: LocaleKeys.light.tr()),
              CustomDividerWidget(isHeight: false),

              // Dark Option
              CustomRadioWidget(title: LocaleKeys.dark.tr()),
              const SizedBox(height: 10),

              CustomButton(
                text: LocaleKeys.apply.tr(),
                onPressed: () {
                  final radioCubit = context.read<RadioCubit>();
                  radioCubit.confirmSelection();
                  final selected = radioCubit.confirmed;
                  final themeCubit = context.read<ThemeCubit>();
                  themeCubit.toggleTheme(selected == "Dark");
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      ),
    ),
  );
}
