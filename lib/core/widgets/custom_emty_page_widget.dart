import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
          child: SvgPicture.asset(image),
        ),
        const SizedBox(height: 15),
        Text(title, style: AppStyles.textStyle24Bold(context).copyWith()),
        const SizedBox(height: 5),
        Text(subTitle, style: AppStyles.textStyle16W600(context)),
      ],
    );
  }
}
