import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/features/categories/data/models/lesson_path_model.dart';
import 'package:sinna/features/categories/data/services/firebase_lesson_pathes_services.dart';

class InstractorViewBody extends StatelessWidget {
  const InstractorViewBody({super.key, required this.lessonPathModel});
  final LessonPathModel lessonPathModel;
  @override
  Widget build(BuildContext context) {
    final doctorpath = FirebaseLessonService.instance;
    return FutureBuilder(
      future: doctorpath.getDoctors(lessonPathModel),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error'));
        }
        final doctors = snapshot.data ?? [];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.separated(
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    lessonPathModel.update(doctor: doctors[index]);
                    GoRouter.of(
                      context,
                    ).push(AppRouter.kLessonsView, extra: lessonPathModel);
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                    child: Center(child: Text(doctors[index])),
                  ),
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: doctors.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
