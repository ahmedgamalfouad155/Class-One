import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/features/categories/data/models/lesson_path_model.dart';
import 'package:sinna/features/categories/data/services/firebase_lesson_pathes_services.dart';

class TermViewBody extends StatelessWidget {
  const TermViewBody({super.key, required this.lessonPathModel});
  final LessonPathModel lessonPathModel;
  @override
  Widget build(BuildContext context) {
        final termsPaths = FirebaseLessonService.instance;

    return FutureBuilder(
      future:termsPaths.getTerms(lessonPathModel),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        final terms = snapshot.data ?? [];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.separated(
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    lessonPathModel.update(term: terms[index]);
                    GoRouter.of(
                      context,
                    ).push(AppRouter.kInstructorView, extra: lessonPathModel);
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                    child: Center(child: Text(terms[index])),
                  ),
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: terms.length,
              ),
            ),
          ],
        );
      },
    );
  }
}

