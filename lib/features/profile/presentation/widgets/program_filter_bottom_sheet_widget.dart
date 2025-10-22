import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/constants/constants.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/core/widgets/custom_filters_widget.dart';
import 'package:sinna/features/profile/presentation/manager/program_filter_cubit.dart';

class ProgramFilterBottomSheetWidget extends StatelessWidget {
  const ProgramFilterBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      // ✅ نستخدم نفس الـ Cubit اللي جاي من MultiBlocProvider فوق
      value: context.read<ProgramFilterCubit>(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Program", style: AppStyles.textStyle16w400Grey(context)),
          CustomFiltersWidget<ProgramFilterCubit>(
            padding: const EdgeInsets.only(top: 10),
            filters: programBottomSheetFilters, 
          ),
          const CustomDividerWidget(isHeight: true),
        ],
      ),
    );
  }
}
