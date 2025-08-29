import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/categories/data/models/course_model.dart';

class UserCoursItemWidget extends StatelessWidget {
  const UserCoursItemWidget({
    super.key,
    required this.numberOfCourse,
    required this.nameOfCourse,
    required this.course,
    required this.isPaied,
  });
  final CourseModel course;
  final int numberOfCourse;
  final String nameOfCourse;
  final bool isPaied;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if (isPaied) {
            GoRouter.of(
              context,
            ).push(AppRouter.kCourseVideoView, extra: course);
          }
        },
        child: Card(
          color: context.appColors.white,
          elevation: 0,
          child: Row(
            children: [
              Text(
                numberOfCourse.toDouble().toString(),
                style: AppStyles.textStyle18(context),
              ),
              const SizedBox(width: 10),
              Text(nameOfCourse, style: AppStyles.textStyle18(context)),
              const Spacer(),
              Icon(
                isPaied ? Icons.lock_open_rounded : Icons.lock_rounded,
                color: context.appColors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
