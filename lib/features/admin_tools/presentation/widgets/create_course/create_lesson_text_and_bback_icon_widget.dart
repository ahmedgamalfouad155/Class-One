import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';

class CreateLessonTextAndBackIconWidget extends StatelessWidget {
  const CreateLessonTextAndBackIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: context.appColors.greyBackground,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              color: context.appColors.black,
            ),
          ),
        ),
        SizedBox(width: context.width / 5),
        Text("Create Lesson", style: AppStyles.textStyle16W600(context)),
      ],
    );
  }
}
