import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';

class UserCoursItemWidget extends StatelessWidget {
  const UserCoursItemWidget({
    super.key,
    required this.course,
    required this.isPaied,
  });
  final CourseModel course;
  final bool isPaied;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isPaied) {
          GoRouter.of(
            context,
          ).push(AppRouter.kCourseVideoScreen, extra: course);
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(course.tittle, style: AppStyles.textStyle14W600(context)),
          CircleAvatar(
            radius: 15.r,
            backgroundColor: context.appColors.greyNavBar,
            child: Icon(
              Icons.play_arrow,
              color: context.appColors.black,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }
}
