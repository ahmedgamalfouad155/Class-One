import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/cubit/radio_cubit/radio_cubit.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/profile/presentation/manager/preferences_cubit/preferences_cubit.dart';
import 'package:sinna/features/profile/presentation/widgets/bottom_sheet/show_specialty_bottom_sheet.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class SpecialtyWidget extends StatelessWidget {
  const SpecialtyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<RadioCubit>(),
      child: BlocListener<RadioCubit, String?>(
        listenWhen: (previous, current) =>
            previous != current && current != null,
        listener: (context, selectedSpecialty) { 
          context.read<PreferencesCubit>().getInstitutions(
            specializationId: selectedSpecialty!,
          );
          context.read<PreferencesCubit>().updateSpecialty(selectedSpecialty);
        },
        child: BlocBuilder<RadioCubit, String?>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => showSpecialtyBottomSheet(
                    context,
                    context.read<RadioCubit>(),
                    context.read<PreferencesCubit>(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.specialty.tr(),
                        style: AppStyles.textStyle16w400Grey(
                          context,
                        ).copyWith(color: context.appColors.black),
                      ),
                      Row(
                        children: [
                          Text(
                            state ?? LocaleKeys.select_specialty.tr(),
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
      ),
    );
  }
}
