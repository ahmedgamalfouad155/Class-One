import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/features/categories/data/models/leson_model.dart';
import 'package:sinna/features/categories/presentation/manager/leason_cubit/lesson_cubit.dart';
import 'package:sinna/features/categories/presentation/manager/leason_cubit/lesson_state.dart';
import 'package:sinna/features/categories/presentation/view/widgets/course_item_widget.dart';

class ListOfCoursesWidget extends StatelessWidget {
  const ListOfCoursesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonCubit, LessonState>(
      builder: (context, state) {
        if (state is LessonLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LessonSuccessState) {
          final sortedLessons = List<CourseModel>.from(state.lesson)
            ..sort((a, b) => a.number.compareTo(b.number));
          return Expanded(
            child: Container(
              decoration: CustomsBoxDecoration().defaultBoxDecoration(context),
              child: ListView.builder(
                itemBuilder: (context, index) => CourseItemWidget(
                  numberOfCourse: sortedLessons[index].number,
                  nameOfCourse: sortedLessons[index].name,
                  course: sortedLessons[index],
                ),
                itemCount: sortedLessons.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
          );
        } else if (state is LessonFailureState) {
          return Text(state.errMessage);
        } else {
          return const Text('error');
        }
      },
    );
  }
}
