import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/widgets/custom_animated_dialod.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/admin_tools/presentation/manager/instructors/instructors_cubit.dart'; 
import 'package:sinna/features/admin_tools/presentation/widgets/instructors/updateing_instructor_dialog.dart';
import 'package:sinna/generated/locale_keys.g.dart'; 


class DeleteInstructorButtonWidget extends StatelessWidget {
  const DeleteInstructorButtonWidget({super.key, required this.widget});

  final UpdateingInstructorDialog widget;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InstructorsCubit, InstructorsState>(
      listener: (context, state) {
        if (state is InstructorDeletedSuccessState) {
          CustomAnimatedDialog.show(
            context: context,
            message: "${LocaleKeys.instructor_deleted_successfully.tr()} ✅🎉",
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
            text:   LocaleKeys.delete.tr(),
            onPressed: () {
              context.read<InstructorsCubit>().deleteInstructor(
                widget.institution.id,
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
