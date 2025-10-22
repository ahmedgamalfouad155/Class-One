import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/widgets/custom_option_widget.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/create_course/create_lesson_bottom_sheet.dart';

class LessonsContentWidget extends StatelessWidget {
  const LessonsContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: CustomsBoxDecoration().profileDecoration(context),
            child: CustomOptionWidget(
              icon: SvgPicture.asset(AppImages.addIcon),
              title: 'Create Lesson',
              onTap: () {
                createLessonBottomSheet(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
