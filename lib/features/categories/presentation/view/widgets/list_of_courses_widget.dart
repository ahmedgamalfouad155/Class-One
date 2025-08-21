import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/features/categories/data/models/course_model.dart';
import 'package:sinna/features/categories/presentation/manager/course_cubit/course_cubit.dart';
import 'package:sinna/features/categories/presentation/manager/course_cubit/course_state.dart';
import 'package:sinna/features/categories/presentation/view/widgets/course_item_widget.dart';

class ListOfCoursesWidget extends StatelessWidget {
  const ListOfCoursesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: CustomsBoxDecoration().defaultBoxDecoration(context),
        child: BlocBuilder<CourseCubit, CourseState>(
          builder: (context, state) {
            if (state is CourseLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CourseSuccessState) {
              final sortedLessons = List<CourseModel>.from(state.courses)
                ..sort((a, b) => a.number.compareTo(b.number));
              return ListView.builder(
                itemBuilder: (context, index) => CourseItemWidget(
                  numberOfCourse: sortedLessons[index].number,
                  nameOfCourse: sortedLessons[index].tittle,
                  course: sortedLessons[index],
                ),
                itemCount: sortedLessons.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              );
            } else if (state is CourseFailureState) {
              return Text(state.errMessage);
            } else {
              return const Text('error');
            }
          },
        ),
      ),
    );
  }
}
