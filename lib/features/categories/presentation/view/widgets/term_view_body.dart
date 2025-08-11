import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/features/categories/data/models/course_path_model.dart';
import 'package:sinna/features/categories/data/services/firebase_lesson_pathes_services.dart';
import 'package:sinna/features/categories/presentation/view/widgets/term_item_widget.dart';

class TermViewBody extends StatelessWidget {
  const TermViewBody({super.key, required this.lessonPathModel});
  final CoursePathModel lessonPathModel;
  @override
  Widget build(BuildContext context) {
    List<String> images = [AppAinmation.one, AppAinmation.two];
    final termsPaths = FirebaseLessonService.instance;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FutureBuilder(
        future: termsPaths.getTerms(lessonPathModel),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final terms = snapshot.data ?? [];
          return SizedBox(
            height: AppMedia.height(context) / 3,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),

              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  lessonPathModel.update(term: terms[index]);
                  GoRouter.of(
                    context,
                  ).push(AppRouter.kInstructorView, extra: lessonPathModel);
                },
                child: TermItemWidget(
                  image: images[index],
                  terms: terms[index],
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemCount: terms.length,
            ),
          );
        },
      ),
    );
  }
}
