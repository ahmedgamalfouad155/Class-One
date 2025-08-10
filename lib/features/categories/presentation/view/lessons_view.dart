import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/categories/data/models/lesson_path_model.dart';
import 'package:sinna/features/categories/presentation/manager/leason_cubit/lesson_cubit.dart';
import 'package:sinna/features/categories/presentation/view/widgets/lessons_view_body.dart';

class LessonsView extends StatelessWidget {
  const LessonsView({super.key, required this.lessonPathModel});
  final LessonPathModel lessonPathModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lessons Page')),
      body: BlocProvider(
        create: (context) { 
          return LessonCubit()..getLeson(lessonPathModel: lessonPathModel);
        },
        child: LessonsViewBody(),
      ),
    );
  }
}
