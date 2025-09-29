import 'package:flutter/material.dart';
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
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(AppImages.anatomy, fit: BoxFit.cover),
            ),
          ),
          Text(subjectName, style: AppStyles.textStyle14W600(context)),
          Text(subjectDoctor, style: AppStyles.textStyle12GreyW400(context)),
        ],
      ),
    );
  }
}
