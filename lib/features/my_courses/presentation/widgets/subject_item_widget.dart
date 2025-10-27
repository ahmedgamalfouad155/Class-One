import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/theme/styles.dart'; 

class SubjectItemWidget extends StatelessWidget {
  const SubjectItemWidget({
    super.key,
    required this.onTap,
    required this.subjectDoctor,
    required this.subjectName,
  });

  final void Function() onTap;
  final String subjectDoctor;
  final String subjectName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: AspectRatio(
              aspectRatio: 1.2,
              child: Image.asset(AppImages.anatomy, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 8),

          Text(
            subjectName,
            style: AppStyles.textStyle16W600(context),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            subjectDoctor,
            style: AppStyles.textStyle16w400Grey(context),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
