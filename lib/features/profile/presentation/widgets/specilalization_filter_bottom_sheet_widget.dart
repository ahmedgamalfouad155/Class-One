import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/constants/constants.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/core/widgets/custom_filters_widget.dart';
import 'package:sinna/features/profile/presentation/manager/specialization_filter_cubit.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class SpecializationFilterBottomSheetWidget extends StatelessWidget {
  const SpecializationFilterBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      // ✅ نستخدم نفس الـ Cubit اللي جاي من MultiBlocProvider فوق
      value: context.read<SpecializationFilterCubit>(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text( LocaleKeys.specialization.tr(), style: AppStyles.textStyle16w400Grey(context)),
          CustomFiltersWidget<SpecializationFilterCubit>(
            padding: const EdgeInsets.only(top: 10),
            filters: specializationBottomSheetFilters, 
          ),
          const CustomDividerWidget(isHeight: true),
        ],
      ),
    );
  }
}
