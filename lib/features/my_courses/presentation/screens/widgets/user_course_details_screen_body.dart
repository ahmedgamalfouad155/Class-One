import 'package:flutter/material.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/core/widgets/default_button_widget.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/my_courses/presentation/screens/widgets/list_of_user_course_widget.dart';

class UserCourseDetailsScreenBody extends StatelessWidget {
  const UserCourseDetailsScreenBody({super.key, required this.coursePathModel});
  final CoursePathModel coursePathModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SizedBox(
            height: AppMedia.height(context) / 3,
            child: Image.asset(AppImages.cours, fit: BoxFit.cover),
          ),
          const SizedBox(height: 20),
          Text(
            coursePathModel.subjectName.toString(),
            style: AppStyles.textStyle24Bold(context),
          ),
          Text(
            coursePathModel.subjectDoctor.toString(),
            style: AppStyles.textStyle16w400Grey(context),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultButtonWidget(
                text: 'Save',
                textColor: context.appColors.blue,
                onPressed: () {},
                icon: Icon(Icons.save, color: context.appColors.blue),
                width: AppMedia.width(context) / 2.5,
                bacgrouncColor: context.appColors.greyBackgroundTextFiled,
              ),
              DefaultButtonWidget(
                text: 'Play',
                onPressed: () {},
                icon: Icon(Icons.play_arrow, color: context.appColors.white),
                width: AppMedia.width(context) / 2.5,
              ),
            ],
          ),
          CustomDividerWidget(isHeight: true),
          ListOfUserCourseWidget(isPaied: coursePathModel.isPaid!),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
