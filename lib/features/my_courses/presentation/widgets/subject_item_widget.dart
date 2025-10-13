import 'package:flutter/material.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';

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
        children: [
          Row(
            children: [
              SizedBox(
                height: context.height / 6,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(AppImages.anatomy, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(subjectName, style: AppStyles.textStyle14W600(context)),
                  Text(
                    subjectDoctor,
                    style: AppStyles.textStyle12GreyW400(context),
                  ),
                ],
              ),
            ],
          ),
          const CustomDividerWidget(isHeight: true, height: 13),
        ],
      ),
    );
  }
}
