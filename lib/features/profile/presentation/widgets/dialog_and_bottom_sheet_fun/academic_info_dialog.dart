import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/cubit/radio_cubit/radio_cubit.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/core/widgets/custom_radio_widget.dart';

/// Dialog مخصص لاختيار الجامعة من قائمة
void showAcademicInfoDialog(BuildContext context, RadioCubit radioCubit) {
  showDialog(
    context: context,
    builder: (_) {
      return BlocProvider.value(
        value: radioCubit,
        child: AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 16),
          backgroundColor: context.appColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text("University", style: AppStyles.textStyle20W600(context)),
          content: SizedBox(
            width: context.width / 1.3,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  _UniversityGroup(
                    options: [
                      "Mansoura University",
                      "Academia Neptunalis",
                      "Universitas Arcanae Felis",
                      "Collegium Aetherus",
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.read<RadioCubit>().cancelSelection();
                Navigator.of(context).pop(false);
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
                    Navigator.of(context).pop(true);
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

/// Group Widget لعرض مجموعة من الجامعات تحت عنوان فرعي
class _UniversityGroup extends StatelessWidget {
  final List<String> options;

  const _UniversityGroup({required this.options});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...options.map(
          (option) => Column(
            children: [
              CustomRadioWidget(title: option),
              if (option != options.last) const CustomDividerWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
