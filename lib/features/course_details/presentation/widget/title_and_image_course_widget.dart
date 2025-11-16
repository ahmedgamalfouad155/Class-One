import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';

class TitleAndImageCourseWidget extends StatelessWidget {
  const TitleAndImageCourseWidget({super.key, required this.coursePathModel});
  final CoursePathModel coursePathModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            height: context.height / 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: context.appColors.greyMoonlight,
            ),
            child: CachedNetworkImage(
              imageUrl: coursePathModel.image.toString(),
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const Center(child: Icon(Icons.image_not_supported_outlined)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          coursePathModel.title.toString(),
          style: AppStyles.textStyle24W600(context),
        ),
        Text(
          coursePathModel.instructor.toString(),
          style: AppStyles.textStyle16w400Grey(context),
        ),
      ],
    );
  }
}
