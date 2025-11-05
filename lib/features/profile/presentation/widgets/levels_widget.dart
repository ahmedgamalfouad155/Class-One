import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/profile/presentation/manager/levels_radio_cubit.dart';
import 'package:sinna/features/profile/presentation/manager/preferences_cubit/preferences_cubit.dart';
import 'package:sinna/features/profile/presentation/widgets/bottom_sheet/show_levels_buttom_sheete.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class LevelsWidget extends StatelessWidget {
  const LevelsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<LevelsRadioCubit>(),
      child: BlocBuilder<LevelsRadioCubit, String?>(
        builder: (context, state) {
          state != null
              ? context.read<PreferencesCubit>().updateLevels(state)
              : null;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => showLevelsButtomSheet(
                  context,
                  context.read<LevelsRadioCubit>(),
                ),
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
                        Icon(
                          Icons.arrow_forward_ios,
                          color: context.appColors.greyNavBar,
                          size: 12,
                        ),
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
