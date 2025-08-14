
import 'package:flutter/material.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/utils/app_media.dart';

class ImageProfileSectionWidget extends StatelessWidget {
  const ImageProfileSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppMedia.height(context) / 5,
      width: AppMedia.width(context),
      decoration: BoxDecoration(
        color: context.appColors.primaryBlue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            decoration: CustomsBoxDecoration().defaultBoxDecoration(
              context,
            ),
            width: 100,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),

              child: Image.asset(AppImages.fav, fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
