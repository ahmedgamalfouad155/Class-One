part of 'create_lesson_cubit.dart';

@immutable
sealed class CreateLessonState {}

final class CreateLessonInitial extends CreateLessonState {}

final class CreateLessonLoadingState extends CreateLessonState {}

final class CreateLessonSuccessState extends CreateLessonState {}

final class CreateLessonFailureState extends CreateLessonState {
  final String errMessage;
  CreateLessonFailureState(this.errMessage);
}
