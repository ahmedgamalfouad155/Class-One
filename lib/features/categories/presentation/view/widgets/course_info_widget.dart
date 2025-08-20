import 'package:flutter/material.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/features/categories/data/models/course_path_model.dart';

class CourseInfoWidget extends StatelessWidget {
  const CourseInfoWidget({super.key, required this.coursePathModel});
  final CoursePathModel coursePathModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppMedia.width(context) / 1.2,
      padding: const EdgeInsets.all(8.0),
      decoration: CustomsBoxDecoration().defaultBoxDecoration(context),
      child: Row(
        children: [
          Image.asset(AppImages.logo, width: 100),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coursePathModel.subject.toString(),
                  style: AppStyles.textStyle18(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ahmed gamal",
                      style: AppStyles.textStyle14(
                        context,
                      ).copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      coursePathModel.term.toString(),
                      style: AppStyles.textStyle14(
                        context,
                      ).copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
