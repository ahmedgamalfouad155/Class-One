import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/course_details/presentation/widget/term_item_widget.dart';

class TermScreenBody extends StatelessWidget {
  const TermScreenBody({super.key, required this.lessonPathModel});
  final CoursePathModel lessonPathModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              lessonPathModel.update(term: "first_term");
              GoRouter.of(
                context,
              ).push(AppRouter.kCoursesScreen, extra: lessonPathModel);
            },
            child: TermItemWidget(image: AppAinmation.one, terms: "First term"),
          ),
          InkWell(
            onTap: () {
              lessonPathModel.update(term: "second_term");
              GoRouter.of(
                context,
              ).push(AppRouter.kCoursesScreen, extra: lessonPathModel);
            },
            child: TermItemWidget(
              image: AppAinmation.two,
              terms: "Second trem",
            ),
          ),
        ],
      ),
    );
  }
}
