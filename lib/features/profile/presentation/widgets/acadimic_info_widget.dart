import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/cubit/radio_cubit/radio_cubit.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/profile/presentation/widgets/dialog_and_bottom_sheet_fun/academic_info_dialog.dart';


class AcademicInfoWidget extends StatelessWidget {
  const AcademicInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<RadioCubit>(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Academic Info',
            style: AppStyles.textStyle16W600(
              context,
            ).copyWith(color: context.appColors.grey),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () =>
                showAcademicInfoDialog(context, context.read<RadioCubit>()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'University',
                  style: AppStyles.textStyle16w400Grey(
                    context,
                  ).copyWith(color: context.appColors.black),
                ),
                Row(
                  children: [
                    BlocBuilder<RadioCubit, String?>(
                      builder: (context, state) {
                        return Text(
                          state ?? "Select University",
                          style: AppStyles.textStyle14W600(context),
                        );
                      },
                    ),
                    const SizedBox(width: 5),
                    const Icon(Icons.arrow_drop_down_sharp),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
