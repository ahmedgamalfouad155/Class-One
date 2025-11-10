import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/course_details/presentation/manager/course_cubit/course_cubit.dart';
import 'package:sinna/features/course_details/presentation/widget/delete_course_icon_widget.dart';
import 'package:sinna/features/course_details/presentation/widget/popup_menu_course_widget.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';

class CourseAppBarWidget extends StatelessWidget {
  const CourseAppBarWidget({super.key, required this.coursePathModel});
  final CoursePathModel coursePathModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
        const SizedBox(width: 10),
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
        Spacer(),
        BlocProvider(
          create: (context) => CourseCubit(),
          child: DeleteCourseIconWidget(coursePathModel: coursePathModel),
        ),
        const SizedBox(width: 10),
        PopupMenuCourseWidget(coursePathModels: coursePathModel),
      ],
    );
  }
}


