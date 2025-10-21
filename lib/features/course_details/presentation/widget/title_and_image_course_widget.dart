import 'package:flutter/material.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';

class TitleAndImageCourseWidget extends StatelessWidget {
  const TitleAndImageCourseWidget({super.key, required this.coursePathModel});
  final CoursePathModel coursePathModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          coursePathModel.title.toString(),
          style: AppStyles.textStyle24W600(context),
        ),
        Text(
          coursePathModel.instructor.toString(),
          style: AppStyles.textStyle16w400Grey(context),
        ),
        const SizedBox(height: 10),
        Center(
          child: SizedBox(
            height: context.height / 3,
            child: Image.asset(AppImages.cours, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 20),
        CustomDividerWidget(isHeight: true),
      ],
    );
  }
}
