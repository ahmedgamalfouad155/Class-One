import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/categories/data/models/course_path_model.dart';
import 'package:sinna/features/categories/presentation/manager/add_to_my_courses_cubit/add_to_my_courses_cubit.dart';
import 'package:sinna/features/categories/presentation/view/widgets/add_to_my_courses_button_widget.dart';
import 'package:sinna/features/categories/presentation/view/widgets/course_info_widget.dart';
import 'package:sinna/features/categories/presentation/view/widgets/list_of_courses_widget.dart';

class CoursesViewBody extends StatelessWidget {
  const CoursesViewBody({super.key, required this.coursePathModel});
  final CoursePathModel coursePathModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CourseInfoWidget(coursePathModel: coursePathModel),
          const SizedBox(height: 20),
          ListOfCoursesWidget(),
          const SizedBox(height: 10),
          BlocProvider(
            create: (context) => AddToMyCoursesCubit(),
            child: AddToMyCoursesButtonWidget(coursePathModel: coursePathModel),
          ),
        ],
      ),
    );
  }
}
