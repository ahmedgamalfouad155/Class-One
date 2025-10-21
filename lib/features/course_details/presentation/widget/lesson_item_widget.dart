import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_animated_dialod.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';

class LessonItemWidget extends StatelessWidget {
  const LessonItemWidget({super.key, required this.course});
  final CourseModel course;
  @override
  Widget build(BuildContext context) {
    final isAdmin = context.read<AuthCubit>().emailAdmin;
    return InkWell(
      onTap: () {
        if (isAdmin) {
          GoRouter.of(
            context,
          ).push(AppRouter.kCourseVideoScreen, extra: course);
        } else {
          course.number == 1
              ? GoRouter.of(
                  context,
                ).push(AppRouter.kCourseVideoScreen, extra: course)
              : CustomAnimatedDialog.show(
                  context: context,
                  message: "Contact with support to pay this course",
                  animationType: DialogAnimationType.warning,
                );
        }
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.tittle,
                    style: AppStyles.textStyle14W600(context),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    course.subTitle,
                    // "${course.hours} : ${course.minutes}",
                    style: AppStyles.textStyle16w400Grey(context),
                  ),
                ],
              ),
              CircleAvatar(
                radius: 20.r,
                backgroundColor: context.appColors.greyMoonlight,
                child: Icon(
                  isAdmin
                      ? Icons.play_arrow
                      : course.number == 1
                      ? Icons.play_arrow
                      : Icons.play_arrow,
                  color: context.appColors.black,
                ),
              ),
            ],
          ),
          CustomDividerWidget(isHeight: true),
        ],
      ),
    );
  }
}
