import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; 
import 'package:sinna/core/theme/styles.dart';

class CustomEmptyScreen extends StatelessWidget {
  const CustomEmptyScreen({super.key, required this.image, required this.title, required this.subTitle});
  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(image),
        const SizedBox(height: 20,),
        Text(title,style: AppStyles.textStyle24Bold(context),),
        const SizedBox(height: 6,),
        Text(subTitle,style: AppStyles.textStyle16w400Grey(context),),
      ],
    );
  }
}
