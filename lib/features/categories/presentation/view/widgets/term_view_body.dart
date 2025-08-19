import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/features/categories/data/models/course_path_model.dart';
import 'package:sinna/features/categories/presentation/view/widgets/term_item_widget.dart';

class TermViewBody extends StatelessWidget {
  const TermViewBody({super.key, required this.lessonPathModel});
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
              ).push(AppRouter.kCoursesView, extra: lessonPathModel);
            },
            child: TermItemWidget(image: AppAinmation.one, terms: "First term"),
          ),
          InkWell(
            onTap: () {
              lessonPathModel.update(term: "second_term");
              GoRouter.of(
                context,
              ).push(AppRouter.kCoursesView, extra: lessonPathModel);
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
