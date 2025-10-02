import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/cubit/radio_cubit/radio_cubit.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/core/widgets/custom_radio_widget.dart';
import 'package:sinna/core/widgets/custom_top_shape_in_bottom_sheet.dart';
import 'package:sinna/features/profile/presentation/screen/widgets/custom_bottom_sheet.dart';

void appearanceContentBottomSheet(BuildContext context) {
  CustomBottomSheet.show(
    context: context,
    child: BlocProvider(
      create: (context) => RadioCubit(initialValue: "System Default"),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         CustomTopShapeINBottomSheet(),
          const SizedBox(height: 10),
          Text("Appearance", style: AppStyles.textStyle16W600(context)),
          CustomRadioWidget(title: 'System Default'),
          CustomDividerWidget(isHeight: false),
          CustomRadioWidget(title: 'Light'),
          CustomDividerWidget(isHeight: false),
          CustomRadioWidget(title: 'Dark'),
          const SizedBox(height: 10),
          CustomButton(text: "Apply", onPressed: () {}),
        ],
      ),
    ),
  );
}
