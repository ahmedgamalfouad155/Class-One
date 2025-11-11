import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/course_details/data/models/attachment_model.dart';
import 'package:sinna/features/course_details/data/services/lesson_mamager_service.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';

part 'lesson_manager_state.dart';

class LessonManagerCubit extends Cubit<LessonManagerState> {
  LessonManagerCubit() : super(LessonManagerInitial());
  final LessonManagerService _lessonManagerService = LessonManagerServiceImpl();
  StreamSubscription? _lessonSubscription;

  Stream<CourseModel> getLesson(String lessonId, CoursePathModel path) {
    emit(GetingLessonLoadingState());
    _lessonSubscription = _lessonManagerService
        .getLesson(lessonId, path)
        .listen(
          (lesson) {
            emit(GetingLessonSuccessState(lesson));
          },
          onError: (e) {
            emit(GetingLessonFailureState(e.toString()));
          },
        );
    return _lessonManagerService.getLesson(lessonId, path);
  }

  Future<void> createLesson(
    CourseModel lessonModel,
    CoursePathModel path,
  ) async {
    try {
      await _lessonManagerService.createLesson(lessonModel, path);
      emit(CreateLessonSuccessState());
    } catch (e) {
      emit(CreateLessonFailureState(e.toString()));
    }
  }

  Future<void> deleteLesson(
    CourseModel lessonModel,
    CoursePathModel path,
  ) async {
    try {
      await _lessonManagerService.deleteLesson(lessonModel, path);
      emit(DeleteLessonSuccessState());
    } catch (e) {
      emit(DeleteLessonFailureState(e.toString()));
    }
  }

  Future<void> updateLesson(
    CourseModel lessonModel,
    CoursePathModel path,
  ) async {
    emit(UpdateLessonLoadingState());
    try {
      await _lessonManagerService.updateLesson(lessonModel, path);
      emit(UpdateLessonSuccessState());
    } catch (e) {
      emit(UpdateLessonFailureState(e.toString()));
    }
  }

  Future<void> addAttachment(
    CourseModel lessonModel,
    CoursePathModel path,
    AttachmentModel attachmentModel, 
  ) async {
    emit(AddAttachmentLoadingState());
    try {
      await _lessonManagerService.addAttachment(
        lessonModel,
        path,
        attachmentModel,
      );
      emit(AddAttachmentSuccessState());
    } catch (e) {
      emit(AddAttachmentFailureState(e.toString()));
    }
  }

  Future<void> removeAttachment(
    CourseModel lessonModel,
    CoursePathModel path,
    AttachmentModel attachmentModel,
  ) async {
    emit(RemoveAttachmentLoadingState());
    try {
      await _lessonManagerService.removeAttachment(
        lessonModel,
        path,
        attachmentModel,
      );
      emit(RemoveAttachmentSuccessState());
    } catch (e) {
      emit(RemoveAttachmentFailureState(e.toString()));
    }
  }
  @override
  Future<void> close() {
    _lessonSubscription?.cancel();
    return super.close();
  }

}
