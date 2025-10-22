import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/widgets/custom_option_widget.dart';
import 'package:sinna/features/admin_tools/presentation/manager/instructors/instructors_cubit.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/dialog/updateing_instructor_dialog.dart';

class ListOfInstructorsWidget extends StatelessWidget {
  const ListOfInstructorsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InstructorsCubit, InstructorsState>(
      bloc: context.read<InstructorsCubit>()..getInstructors(),
      builder: (context, state) {
        if (state is InstructorsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is InstructorsLoadedState) {
          final instructors = state.instructors;
          return Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: CustomsBoxDecoration().profileDecoration(context),
                child: CustomOptionWidget(
                  title: instructors[index].name,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => UpdateingInstructorDialog(
                        instructor: instructors[index],
                      ),
                    );
                  },
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: instructors.length,
            ),
          );
        }
        if (state is InstructorsLoadFailureState) {
          return Text(state.errMessage);
        } else {
          return const Text("error");
        }
      },
    );
  }
}
