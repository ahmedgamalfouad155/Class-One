import 'package:flutter/material.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/features/explore/data/models/subject_info_model.dart';

class NameOfSubjectItemWidget extends StatelessWidget {
  const NameOfSubjectItemWidget({
    super.key,
    required this.subjectInfo,
    required this.onTap,
  });

  final SubjectInfoModel subjectInfo;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: AppMedia.height(context) / 5,
            width: AppMedia.width(context) / 4,
            padding: EdgeInsets.only(bottom: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(AppImages.anatomy, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subjectInfo.subjectName,
                style: AppStyles.textStyle14W600(context),
              ),
              const SizedBox(height: 5),
              Text(
                subjectInfo.subjectDoctor,
                style: AppStyles.textStyle12GreyW400(
                  context,
                ).copyWith(color: context.appColors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
