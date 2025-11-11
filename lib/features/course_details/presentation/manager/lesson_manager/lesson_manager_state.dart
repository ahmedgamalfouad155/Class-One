part of 'lesson_manager_cubit.dart';

@immutable
sealed class LessonManagerState {}

final class LessonManagerInitial extends LessonManagerState {}

final class GetingLessonLoadingState extends LessonManagerState {}

final class GetingLessonSuccessState extends LessonManagerState {
  final CourseModel lesson;
  GetingLessonSuccessState(this.lesson);
}

final class GetingLessonFailureState extends LessonManagerState {
  final String errMessage;
  GetingLessonFailureState(this.errMessage);
}

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

final class AddAttachmentLoadingState extends LessonManagerState {}

final class AddAttachmentSuccessState extends LessonManagerState {}

final class AddAttachmentFailureState extends LessonManagerState {
  final String errMessage;
  AddAttachmentFailureState(this.errMessage);
}

final class RemoveAttachmentLoadingState extends LessonManagerState {}

final class RemoveAttachmentSuccessState extends LessonManagerState {}

final class RemoveAttachmentFailureState extends LessonManagerState {
  final String errMessage;
  RemoveAttachmentFailureState(this.errMessage);
}
