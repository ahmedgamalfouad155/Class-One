import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/constants/constants.dart';
import 'package:sinna/core/cubit/special_cubit/special_cubit.dart';
import 'package:sinna/core/widgets/custom_filters_widget.dart';
import 'package:sinna/features/explore/presentation/screens/widgets/list_of_subjects_widget.dart';
import 'package:sinna/features/explore/presentation/screens/widgets/search_and_more_icon_widget.dart';

class ExploreScreenBody extends StatelessWidget {
  const ExploreScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SearchAndMoreIconWidget(),
          BlocProvider(
            create: (context) => FilterCubit(),
            child: CustomFiltersWidget(
              padding: const EdgeInsets.only(left: 25.0, top: 20),
              filters: specializationExpolreFilters,
            ),
          ),
          ListOfSubjectsWidget(),
        ],
      ),
    );
  }
}
