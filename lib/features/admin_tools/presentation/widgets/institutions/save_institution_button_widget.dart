
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/widgets/custom_animated_dialod.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/admin_tools/presentation/manager/institutions_cubit/institutions_cubit.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class SaveInstitutionButtonWidget extends StatelessWidget {
  const SaveInstitutionButtonWidget({
    super.key,
    required this.formKey,
    required this.institutionController,
    required this.specializationId,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController institutionController;
  final String specializationId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InstitutionsCubit, InstitutionsState>(
      buildWhen: (previous, current) =>
          current is InstitutionsInitial ||
          current is InstitutionAddedSuccessState ||
          current is InstitutionAddFailureState ||
          current is InstitutionAddingState,
      listener: (context, state) {
        if (state is InstitutionAddedSuccessState) {
          CustomAnimatedDialog.show(
            context: context,
            message: "${LocaleKeys.instiution_added_successfully.tr()} ✅🎉",
            animationType: DialogAnimationType.success,
          );
        }
      },
      builder: (context, state) {
        if (state is InstitutionAddingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is InstitutionAddedSuccessState ||
            state is InstitutionsInitial) {
          return CustomButton(
            text:   LocaleKeys.save.tr(),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<InstitutionsCubit>().addInstitution(
                  specializationId: specializationId,
                  institutionname: institutionController.text.trim(),
                );
              }
            },
          );
        }
        if (state is InstitutionAddFailureState) {
          return Text(state.errMessage);
        } else {
          return const Text("error");
        }
      },
    );
  }
}
