import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/profile/presentation/manager/institutions_cubit.dart';
import 'package:sinna/features/profile/presentation/widgets/bottom_sheet/show_institutions_bottom_sheet.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class InstitutionsInfoWidget extends StatelessWidget {
  const InstitutionsInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<InstitutionsRadioCubit>(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => showInstitutionsBottomSheet(
              context,
              context.read<InstitutionsRadioCubit>(),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.institutions.tr(),
                  style: AppStyles.textStyle16w400Grey(
                    context,
                  ).copyWith(color: context.appColors.black),
                ),
                Row(
                  children: [
                    BlocBuilder<InstitutionsRadioCubit, String?>(
                      builder: (context, state) {
                        return Text(
                          state ?? LocaleKeys.select_university.tr(),
                          style: AppStyles.textStyle14W600(context),
                        );
                      },
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
      ),
    );
  }
}
