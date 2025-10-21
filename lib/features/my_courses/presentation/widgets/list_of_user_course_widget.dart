import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';
import 'package:sinna/features/course_details/presentation/manager/course_cubit/course_cubit.dart';
import 'package:sinna/features/course_details/presentation/manager/course_cubit/course_state.dart';
import 'package:sinna/features/my_courses/presentation/widgets/user_cours_item_widget.dart';

class ListOfUserCourseWidget extends StatelessWidget {
  const ListOfUserCourseWidget({super.key, required this.isPaied});
  final bool isPaied;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CourseCubit, CourseState>(
        builder: (context, state) { 
          if (state is CourseLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CourseSuccessState) { 
            final sortedLessons = List<CourseModel>.from(state.courses)
              ..sort((a, b) => a.number.compareTo(b.number));
            return ListView.builder(
              itemBuilder: (context, index) => Column(
                children: [
                  UserCoursItemWidget(
                    course: sortedLessons[index],
                    isPaied: isPaied,
                  ),
                  CustomDividerWidget(isHeight: true),
                ],
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
    );
  }
}
