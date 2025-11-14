import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'package:sinna/core/widgets/custom_animated_dialod.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/admin_tools/data/models/institution_model.dart';
import 'package:sinna/features/admin_tools/presentation/manager/institutions_cubit/institutions_cubit.dart';

class UpdateInstitutionButtonWidget extends StatelessWidget {
  const UpdateInstitutionButtonWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.institution,
    required this.institutionController,
    required this.specializationId,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final InstitutionModel institution;

  final TextEditingController institutionController;
  final String specializationId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InstitutionsCubit, InstitutionsState>(
      buildWhen: (previous, current) =>
          current is InstitutionUpdatingState ||
          current is InstitutionUpdatedSuccessState ||
          current is InstitutionUpdateFailureState ||
          current is InstitutionsInitial,
      listener: (context, state) {
        if (state is InstitutionUpdatedSuccessState) {
          CustomAnimatedDialog.show(
            context: context,
            message: "Instructor updated successfully ✅🎉",
            animationType: DialogAnimationType.success,
          );
        }
      },
      builder: (context, state) {
        if (state is InstitutionUpdatingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is InstitutionUpdatedSuccessState ||
            state is InstitutionsInitial) {
          return CustomButton( 
            text: "Update",
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final updatedInstitution = institution
                  ..update(name: institutionController.text.trim());
                context.read<InstitutionsCubit>().updateInstitution(
                  specializationId: specializationId,
                  institutionModel: updatedInstitution,
                );
              }
            },
          );
        } else if (state is InstitutionUpdateFailureState) {
          return Text(state.errMessage);
        } else {
          return const Text("error");
        }
      },
    );
  }
}
