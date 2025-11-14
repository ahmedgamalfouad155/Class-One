
import 'package:flutter/material.dart'; 
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/widgets/custom_animated_dialod.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/admin_tools/presentation/manager/fields/fields_cubit.dart';

class CreateFieldButtonWidget extends StatelessWidget {
  const CreateFieldButtonWidget({
    super.key,
    required this.formKey,
    required this.fieldController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController fieldController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FieldsCubit, FieldsState>(
      buildWhen: (previous, current) =>
          current is AddingFieldsLoadingState ||
          current is AddingFieldsSuccessState ||
          current is AddingFieldsFailureState ||
          current is FieldsInitial,
      listener: (context, state) {
        if (state is AddingFieldsSuccessState) {
          CustomAnimatedDialog.show(
            context: context,
            message: "Field added successfully ✅🎉",
            animationType: DialogAnimationType.success,
          );
        }
      },
      builder: (context, state) {
        if (state is AddingFieldsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is AddingFieldsSuccessState ||
            state is FieldsInitial) {
          return CustomButton(
            text: "Create",
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<FieldsCubit>().addField(
                  fieldController.text.trim(),
                );
              }
            },
          );
        } else if (state is AddingFieldsFailureState) {
          return Text(state.errMessage);
        } else {
          return const Text("error");
        }
      },
    );
  }
}
