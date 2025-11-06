import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/constants/constants.dart';
import 'package:sinna/core/cubit/special_cubit/filter_cubit.dart';
import 'package:sinna/core/widgets/custom_filters_widget.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:sinna/features/course_details/presentation/manager/course_cubit/course_cubit.dart';
import 'package:sinna/features/course_details/presentation/manager/course_cubit/course_state.dart';
import 'package:sinna/features/course_details/presentation/widget/list_of_lessons_widget.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/course_details/presentation/manager/add_to_my_courses_cubit/add_to_my_courses_cubit.dart';
import 'package:sinna/features/course_details/presentation/widget/add_to_my_courses_button_widget.dart';

class CoursesScreenBody extends StatelessWidget {
  const CoursesScreenBody({super.key, required this.coursePathModel});
  final CoursePathModel coursePathModel;

  @override
  Widget build(BuildContext context) {
    final isAdmin = context.read<AuthCubit>().emailAdmin;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocProvider(
        create: (_) => FilterCubit(),
        child: SingleChildScrollView(
          child: BlocBuilder<CourseCubit, CourseState>(
            builder: (context, state) {
              if (state is CourseLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is CourseSuccessState) {
                final sortedLessons = List<CourseModel>.from(state.courses)
                  ..sort((a, b) => a.number.compareTo(b.number));
                bool hasSecondTerm = sortedLessons.any(
                  (lesson) => lesson.term.contains('second term'),
                );

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TitleAndImageCourseWidget(coursePathModel: coursePathModel),
                    const SizedBox(height: 10),
                    if (hasSecondTerm)
                      CustomFiltersWidget<FilterCubit>(filters: terms),
                    const SizedBox(height: 10),
                    ListOfLessonsWidget(
                      sortedLessons: sortedLessons,
                      coursePathModels: coursePathModel,
                    ),
                    const SizedBox(height: 10),
                    if (isAdmin)
                      BlocProvider(
                        create: (context) => AddToMyCoursesCubit(),
                        child: AddToMyCoursesButtonWidget(
                          coursePathModel: coursePathModel,
                        ),
                      ),
                  ],
                );
              }

              if (state is CourseFailureState) {
                return Text(state.errMessage);
              }

              return const Text('error');
            },
          ),
        ),
      ),
    );
  }
}
