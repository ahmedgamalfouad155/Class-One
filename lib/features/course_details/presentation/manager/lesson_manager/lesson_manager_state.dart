part of 'lesson_manager_cubit.dart';

@immutable
sealed class LessonManagerState {}

final class LessonManagerInitial extends LessonManagerState {}

final class CreateLessonLoadingState extends LessonManagerState {}

final class CreateLessonSuccessState extends LessonManagerState {}

final class CreateLessonFailureState extends LessonManagerState {
  final String errMessage;
  CreateLessonFailureState(this.errMessage);
}

final class DeleteLessonSuccessState extends LessonManagerState {}

final class DeleteLessonFailureState extends LessonManagerState {
  final String errMessage;
  DeleteLessonFailureState(this.errMessage);
}

  final class UpdateLessonLoadingState extends LessonManagerState {}

  final class UpdateLessonSuccessState extends LessonManagerState {}

final class UpdateLessonFailureState extends LessonManagerState {
  final String errMessage;
  UpdateLessonFailureState(this.errMessage);
}
