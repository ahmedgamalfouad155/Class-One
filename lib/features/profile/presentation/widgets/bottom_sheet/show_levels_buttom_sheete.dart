import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/core/widgets/level_radio_widget.dart';
import 'package:sinna/features/profile/presentation/manager/levels_radio_cubit.dart';
import 'package:sinna/features/profile/presentation/widgets/custom_bottom_sheet.dart';
import 'package:sinna/features/profile/presentation/widgets/title_in_buttom_sheet_widget.dart';

void showLevelsButtomSheet(BuildContext context, LevelsRadioCubit radioCubit) {
  CustomBottomSheet.show(
    context: context,
    child: BlocProvider.value(
      value: radioCubit,
      child: SizedBox(
        height: context.height * 0.93,
        width: context.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TitleInButtomSheetWidget(title: "Levels"),
              const LevelRadioWidget(title: "Year 1"),
              const CustomDividerWidget(),
              const LevelRadioWidget(title: "Year 2"),
              const CustomDividerWidget(),
              const LevelRadioWidget(title: "Year 3"),
              const CustomDividerWidget(),
              const LevelRadioWidget(title: "Year 4"),
              const CustomDividerWidget(),
              const LevelRadioWidget(title: "Year 5"),
              const CustomDividerWidget(),
              const LevelRadioWidget(title: "Master’s Degree"),
            ],
          ),
        ),
      ),
    ),
  );
}
