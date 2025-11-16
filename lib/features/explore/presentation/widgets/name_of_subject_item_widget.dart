import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinna/core/constants/images.dart'; 
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/features/explore/data/models/course_info_model.dart';

class NameOfSubjectItemWidget extends StatelessWidget {
  const NameOfSubjectItemWidget({
    super.key,
    required this.subjectInfo,
    required this.onTap,
  });

  final CourseInfoModel subjectInfo;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: context.height / 7,
            width: context.width / 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(AppImages.anatomy, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subjectInfo.title,
                  style: AppStyles.textStyle22W600(context),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  subjectInfo.instructor,
                  style: AppStyles.textStyle15W400Grey(context),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
