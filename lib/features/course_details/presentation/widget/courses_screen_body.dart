import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/course_details/presentation/manager/add_to_my_courses_cubit/add_to_my_courses_cubit.dart';
import 'package:sinna/features/course_details/presentation/widget/add_to_my_courses_button_widget.dart';
import 'package:sinna/features/course_details/presentation/widget/list_of_courses_widget.dart';

class CoursesScreenBody extends StatelessWidget {
  const CoursesScreenBody({super.key, required this.coursePathModel});
  final CoursePathModel coursePathModel;
  @override
  Widget build(BuildContext context) {
    final isAdmin = context.read<AuthCubit>().emailAdmin;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          ListOfCoursesWidget(),
          const SizedBox(height: 10),

          isAdmin
              ? BlocProvider(
                  create: (context) => AddToMyCoursesCubit(),
                  child: AddToMyCoursesButtonWidget(
                    coursePathModel: coursePathModel,
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
