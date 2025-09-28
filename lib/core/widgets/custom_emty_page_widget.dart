import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';

class CustomEmptyPage extends StatelessWidget {
  const CustomEmptyPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });
  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          child: Image.asset(image),
        ),
        const SizedBox(height: 15),
        Text(
          title,
          style: AppStyles.textStyle20W600(context).copyWith(
            fontWeight: FontWeight.bold,
            color: context.appColors.blue,
          ),
        ),
        const SizedBox(height: 5),
        Text(subTitle, style: AppStyles.textStyle16W600(context)),
      ],
    );
  }
}
