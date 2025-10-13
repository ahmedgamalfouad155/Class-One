import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';

class CourseItemWidget extends StatelessWidget {
  const CourseItemWidget({
    super.key,
    required this.numberOfCourse,
    required this.nameOfCourse,
    required this.course,
  });
  final CourseModel course;
  final int numberOfCourse;
  final String nameOfCourse;

  @override
  Widget build(BuildContext context) {
    final isAdmin = context.read<AuthCubit>().emailAdmin;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if (isAdmin) {
            GoRouter.of(
              context,
            ).push(AppRouter.kCourseVideoScreen, extra: course);
          } else {
            numberOfCourse == 1
                ? GoRouter.of(
                    context,
                  ).push(AppRouter.kCourseVideoScreen, extra: course)
                : null;
          }
        },
        child: Card(
          color: context.appColors.white,
          elevation: 0,
          child: Row(
            children: [
              Text(
                numberOfCourse.toDouble().toString(),
                style: AppStyles.textStyle18Bold(context),
              ),
              const SizedBox(width: 10),
              Text(nameOfCourse, style: AppStyles.textStyle18Bold(context)),
              const Spacer(),
              Icon(
                isAdmin
                    ? Icons.lock_open_rounded
                    : numberOfCourse == 1
                    ? Icons.lock_open_rounded
                    : Icons.lock_rounded,
                color: context.appColors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
