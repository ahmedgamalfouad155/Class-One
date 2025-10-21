import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/constants/constants.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/core/cubit/special_cubit/filter_cubit.dart';
import 'package:sinna/core/widgets/custom_filters_widget.dart';

class SpecializationFilterBottomSheetWidget extends StatelessWidget {
  const SpecializationFilterBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Specialization", style: AppStyles.textStyle16w400Grey(context)),

        BlocProvider(
          create: (context) => FilterCubit(),
          child: CustomFiltersWidget(
            padding: const EdgeInsets.only(top: 10),
            filters: specializationBottomSheetFilters,
            layoutType: SpecialLayoutType.equal,
          ),
        ),
        CustomDividerWidget(isHeight: true),
      ],
    );
  }
}
