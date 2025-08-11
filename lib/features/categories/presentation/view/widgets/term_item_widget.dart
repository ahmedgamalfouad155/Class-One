import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';

class TermItemWidget extends StatelessWidget {
  const TermItemWidget({super.key, required this.terms, required this.image});

  final String terms;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppMedia.width(context) / 2.5,
      decoration: CustomsBoxDecoration().defaultBoxDecoration(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(image, height: 100),
          const SizedBox(height: 10),
          Text(
            terms,
            style: AppStyles.textStyle18(
              context,
            ).copyWith(color: context.appColors.primaryBlue),
          ),
        ],
      ),
    );
  }
}
