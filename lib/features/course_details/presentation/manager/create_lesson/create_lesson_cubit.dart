import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'package:sinna/features/course_details/data/services/create_lesson_service.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';

part 'create_lesson_state.dart';

class CreateLessonCubit extends Cubit<CreateLessonState> {
  CreateLessonCubit() : super(CreateLessonInitial());
  final CreateLessonService _createLessonService = CreateLessonServiceImpl();

  Future<void> createLesson(
    CourseModel lessonModel,
    CoursePathModel path,
  ) async {
    try {
      await _createLessonService.createLesson(lessonModel, path);
      emit(CreateLessonSuccessState());
    } catch (e) {
      emit(CreateLessonFailureState(e.toString()));
    }
  }
}
