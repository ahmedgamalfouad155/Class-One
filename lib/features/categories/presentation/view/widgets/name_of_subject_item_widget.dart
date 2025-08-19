import 'package:flutter/material.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/default_button_widget.dart';
import 'package:sinna/features/categories/data/models/subject_info_model.dart';

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
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
        decoration: CustomsBoxDecoration().defaultBoxDecoration(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround, 
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(AppImages.logo),
            ),
            Text(
              subjectInfo.subjectName,
              style: AppStyles.textStyle16(
                context,
              ).copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              subjectInfo.subjectDoctor,
              style: AppStyles.textStyle12(context).copyWith(
                fontWeight: FontWeight.bold,
                color: context.appColors.blue,
              ),
            ),
            DefaultButtonWidget(
              text: "Start Now",
              onPressed: () {},
              width: AppMedia.width(context) / 4,
              height: 30,
              textStyle: AppStyles.textStyle14(context).copyWith(
                color: context.appColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
