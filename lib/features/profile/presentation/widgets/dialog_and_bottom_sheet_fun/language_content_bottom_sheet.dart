import 'package:easy_localization/easy_localization.dart';
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
  final currentLocale = context.locale.languageCode; 

  CustomBottomSheet.show(
    context: context,
    child: BlocProvider(
      create: (context) =>
          RadioCubit(initialValue: currentLocale == "en" ? "English" : "عربي"),
      child: Builder(
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomTopShapeINBottomSheet(),
              Text("Language", style: AppStyles.textStyle16W600(context)),
              const SizedBox(height: 20), 
              CustomRadioWidget(title: "English"),
              CustomDividerWidget(isHeight: false), 
              CustomRadioWidget(title: "عربي"),
              const SizedBox(height: 20), 
              CustomButton(
                text: "Apply",
                onPressed: () async {
                  final radioCubit = context.read<RadioCubit>();
                  radioCubit.confirmSelection(); 
                  final selected = radioCubit.confirmed; 
                  if (selected == "English") {
                    await context.setLocale(const Locale('en'));
                  } else if (selected == "عربي") {
                    await context.setLocale(const Locale('ar'));
                  } 
                  // ignore: use_build_context_synchronously
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
