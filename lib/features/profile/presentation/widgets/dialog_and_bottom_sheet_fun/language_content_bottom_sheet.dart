import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/cubit/radio_cubit/radio_cubit.dart'; 
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/core/widgets/custom_radio_widget.dart';
import 'package:sinna/core/widgets/custom_top_shape_in_bottom_sheet.dart';
import 'package:sinna/features/profile/presentation/widgets/custom_bottom_sheet.dart';

void languageContentBottomSheet(BuildContext context) {
  CustomBottomSheet.show(
    context: context,
    child: BlocProvider(
      create: (context) => RadioCubit(initialValue: "English"),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomTopShapeINBottomSheet(),
          Text("Language", style: AppStyles.textStyle16W600(context)),
          const SizedBox(height: 20),
          CustomRadioWidget(title: "English"),
          CustomDividerWidget(isHeight: false),
          CustomRadioWidget(title: "عربي"),
          const SizedBox(height: 20),
          CustomButton(text: "Apply", onPressed: () {}),
        ],
      ),
    ),
  );
}
