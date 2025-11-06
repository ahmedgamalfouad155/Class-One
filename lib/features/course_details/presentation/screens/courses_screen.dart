import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/course_details/presentation/manager/course_cubit/course_cubit.dart';
import 'package:sinna/features/course_details/presentation/widget/courses_screen_body.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key, required this.coursePathModel});
  final CoursePathModel coursePathModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 18.r,
              backgroundImage: AssetImage(AppImages.cours),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coursePathModel.title.toString(),
                  style: AppStyles.textStyle15W600(context),
                ),

                Text(
                  coursePathModel.instructor.toString(),
                  style: AppStyles.textStyle15W400Grey(context),
                ),
              ],
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: BlocProvider(
        create: (context) {
          return CourseCubit()..getLeson(coursePathModel: coursePathModel);
        },
        child: SafeArea(
          child: CoursesScreenBody(coursePathModel: coursePathModel),
        ),
      ),
    );
  }
}
