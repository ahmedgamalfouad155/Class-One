import 'package:flutter/material.dart'; 
import 'package:sinna/core/constants/constants.dart';
import 'package:sinna/core/theme/colors.dart'; 
import 'package:sinna/core/widgets/custom_filters_widget.dart';
import 'package:sinna/core/cubit/special_cubit/filter_cubit.dart';

class TermsWidget extends StatelessWidget {
  const TermsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.appColors.greyMoonlight,
        borderRadius: BorderRadius.circular(10),
      ), 
      child: CustomFiltersWidget<FilterCubit>(
        padding: const EdgeInsets.symmetric(vertical: 10),
        filters: terms,
      ),
    );
  }
}
