import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/features/categories/data/models/course_model.dart';
import 'package:sinna/features/categories/presentation/manager/course_cubit/course_cubit.dart';
import 'package:sinna/features/categories/presentation/manager/course_cubit/course_state.dart';
import 'package:sinna/features/my_courses/presentation/view/widgets/user_cours_item_widget.dart';

class ListOfUserCourseWidget extends StatelessWidget {
  const ListOfUserCourseWidget({super.key, required this.isPaied});
  final bool isPaied;

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
                itemBuilder: (context, index) => UserCoursItemWidget(
                  numberOfCourse: sortedLessons[index].number,
                  nameOfCourse: sortedLessons[index].tittle,
                  course: sortedLessons[index],
                  isPaied: isPaied,
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
