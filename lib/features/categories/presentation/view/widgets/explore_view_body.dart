import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/constants/constants.dart';
import 'package:sinna/features/categories/presentation/manager/special_cubit/special_cubit.dart';
import 'package:sinna/features/categories/presentation/view/widgets/list_of_specialt_items_widget.dart';
import 'package:sinna/features/categories/presentation/view/widgets/list_of_subjects_widget.dart';
import 'package:sinna/features/categories/presentation/view/widgets/search_and_more_icon_widget.dart';

class ExploreViewBody extends StatelessWidget {
  const ExploreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SearchAndMoreIconWidget(),
          BlocProvider(
            create: (context) => SpecialCubit(),
            child: ListOfSpecialtItemsWidget(
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
