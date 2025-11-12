import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/helper/normalize_firestore_name.dart';
import 'package:sinna/core/widgets/custom_option_widget.dart';
import 'package:sinna/features/admin_tools/presentation/manager/institutions_cubit/institutions_cubit.dart';

class ListOfInstitutionWidget extends StatelessWidget {
  const ListOfInstitutionWidget({super.key, required this.specialization});

  final String specialization;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InstitutionsCubit, InstitutionsState>(
      bloc: context.read<InstitutionsCubit>()
        ..getInstitutions(specialization: specialization),
      builder: (context, state) {
        if (state is InstitutionsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is InstitutionsLoadedState) {
          final institutions = state.institutions;
          return Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => CustomOptionWidget(
                title: denormalizeFirestoreName(institutions[index]),
                onTap: () {
                  // showDialog(
                  //   context: context,
                  //   builder: (_) => UpdateingInstitutionDialog(
                  //     institution: institutions[index],
                  //   ),
                  // );
                },
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: institutions.length,
            ),
          );
        }
        if (state is InstitutionsLoadFailureState) {
          return Text(state.errMessage);
        } else {
          return const Text("error");
        }
      },
    );
  }
}
