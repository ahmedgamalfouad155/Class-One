import 'package:flutter/material.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/default_button_widget.dart';

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
              subjectName,
              style: AppStyles.textStyle16W600(
                context,
              ).copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              subjectDoctor,
              style: AppStyles.textStyle12GreyW400(context).copyWith(
                fontWeight: FontWeight.bold,
                color: context.appColors.blue,
              ),
            ),
            DefaultButtonWidget(
              text: "Start Now",
              onPressed: () {},
              width: AppMedia.width(context) / 4,
              height: 30,
              textStyle: AppStyles.textStyle14W600(context).copyWith(
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
