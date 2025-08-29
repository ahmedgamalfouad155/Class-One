import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/my_courses/presentation/manager/cubit/my_courses_cubit.dart';
import 'package:sinna/features/my_courses/presentation/view/app_bar_my_courses.dart';
import 'package:sinna/features/my_courses/presentation/view/widgets/my_courses_view_body.dart';

class MyCorsesView extends StatelessWidget {
  const MyCorsesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMyCourses(context),
      body: BlocProvider(
        create: (context) => MyCoursesCubit()..getMyCourses(),
        child: MyCoursesViewBody(),
      ),
    );
  }
}
