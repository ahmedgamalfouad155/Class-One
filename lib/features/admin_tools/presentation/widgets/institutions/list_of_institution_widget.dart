import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/widgets/custom_option_widget.dart';
import 'package:sinna/features/admin_tools/presentation/manager/institutions_cubit/institutions_cubit.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/institutions/institution_bottom_sheet.dart';

class ListOfInstitutionWidget extends StatelessWidget {
  const ListOfInstitutionWidget({super.key, required this.specializationId});

  final String specializationId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InstitutionsCubit, InstitutionsState>(
      bloc: context.read<InstitutionsCubit>()
        ..getInstitutions(specializationId: specializationId),
      builder: (context, state) {
        if (state is InstitutionsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is InstitutionsLoadedState) {
          final institutions = state.institutions;
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => CustomOptionWidget(
              title: institutions[index].name,
              onTap: () {
                institutionBottomSheet(
                  context,
                  specializationId,
                  true,
                  institutions[index],
                ); 
              },
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: institutions.length,
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
