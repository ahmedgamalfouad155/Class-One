import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/my_courses/presentation/manager/cubit/my_courses_cubit.dart';
import 'package:sinna/features/my_courses/presentation/screens/widgets/my_courses_view_body.dart';

class MyCorsesScreen extends StatelessWidget {
  const MyCorsesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MyCoursesCubit()..getMyCourses(),
        child: SafeArea(child: MyCoursesScreenBody()),
      ),
    );
  }
}
