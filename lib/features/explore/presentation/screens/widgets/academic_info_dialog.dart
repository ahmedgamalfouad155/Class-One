import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/cubit/radio_cubit/radio_cubit.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/core/widgets/custom_radio_widget.dart';

void showAcademicInfoDialog(BuildContext context, RadioCubit radioCubit) {
  showDialog(
    context: context,
    builder: (_) {
      return BlocProvider.value(
        value: radioCubit,
        child: AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 0),
          backgroundColor: context.appColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text("University", style: AppStyles.textStyle20W600(context)),
          content: SizedBox(
            width: AppMedia.width(context) / 1.3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Regnum Solenvaria",
                  style: AppStyles.textStyle16W600Grey(context),
                ),

                CustomRadioWidget(title: "Universitas Luminae Magna"),
                CustomDividerWidget(),
                CustomRadioWidget(title: "Academia Neptunalis"),
                CustomDividerWidget(),
                CustomRadioWidget(title: "Universitas Arcanae Felis"),
                CustomDividerWidget(),
                CustomRadioWidget(title: "Collegium Aetherus"),
                const SizedBox(height: 10),
                Text(
                  "Confœderatio Nivalis",
                  style: AppStyles.textStyle16W600Grey(context),
                ),
                CustomRadioWidget(title: "Schola Obsidianis"),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.read<RadioCubit>().cancelSelection();
                Navigator.of(context).pop(false); // Cancel
              },
              child: Text(
                "Cancel",
                style: AppStyles.textStyle16W600(
                  context,
                ).copyWith(color: context.appColors.blue),
              ),
            ),
            BlocBuilder<RadioCubit, String?>(
              builder: (context, state) {
                return TextButton(
                  onPressed: () {
                    context.read<RadioCubit>().confirmSelection();
                    Navigator.of(context).pop(false);
                  },
                  child: Text(
                    "Confirm",
                    style: AppStyles.textStyle16W600(
                      context,
                    ).copyWith(color: context.appColors.blue),
                  ),
                );
              },
            ),
          ],
        ),
      );
    },
  );
}
