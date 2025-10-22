import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/widgets/custom_animated_dialod.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/admin_tools/presentation/manager/instructors/instructors_cubit.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/dialog/updateing_instructor_dialog.dart';

class DeleteButtonWidget extends StatelessWidget {
  const DeleteButtonWidget({super.key, required this.widget});

  final UpdateingInstructorDialog widget;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InstructorsCubit, InstructorsState>(
      listener: (context, state) {
        if (state is InstructorDeletedSuccessState) {
          CustomAnimatedDialog.show(
            context: context,
            message: "Instructor deleted successfully ✅🎉",
            animationType: DialogAnimationType.success,
          ); 
        }
      },
      builder: (context, state) { 
        if (state is InstructorDeletingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is InstructorDeletedSuccessState ||
            state is InstructorsInitial) {
          return CustomButton(
            text: "Delete",
            onPressed: () {
              context.read<InstructorsCubit>().deleteInstructor(
                widget.instructor.id,
              );
            },
            bacgrouncColor: context.appColors.greyMoonlight,
            textColor: context.appColors.red,
            borderSideColor: context.appColors.greyMoonlight,
          );
        } else if (state is InstructorDeleteFailureState) {
          return Text(state.errMessage);
        } else {
          return const Text("error");
        }
      },
    );
  }
}
