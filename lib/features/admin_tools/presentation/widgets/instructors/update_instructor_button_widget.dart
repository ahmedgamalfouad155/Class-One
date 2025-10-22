import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/widgets/custom_animated_dialod.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/admin_tools/data/models/instructor_model.dart';
import 'package:sinna/features/admin_tools/presentation/manager/instructors/instructors_cubit.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/instructors/updateing_instructor_dialog.dart';

class UpdateInstructorButtonWidget extends StatelessWidget {
  const UpdateInstructorButtonWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.widget,
    required this.nameController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final UpdateingInstructorDialog widget;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InstructorsCubit, InstructorsState>(
      listener: (context, state) {
        if (state is InstructorUpdatedSuccessState) {
          CustomAnimatedDialog.show(
            context: context,
            message: "Instructor updated successfully ✅🎉",
            animationType: DialogAnimationType.success,
          );
        }
      },
      builder: (context, state) {
        if (state is InstructorUpdatingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is InstructorUpdatedSuccessState ||
            state is InstructorsInitial) {
          return CustomButton(
            text: "Update",
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<InstructorsCubit>().updateInstructor(
                  InstructorModel(
                    id: widget.instructor.id,
                    name: nameController.text,
                  ),
                );
              }
            },
          );
        } else if (state is InstructorUpdateFailureState) {
          return Text(state.errMessage);
        } else {
          return const Text("error");
        }
      },
    );
  }
}
