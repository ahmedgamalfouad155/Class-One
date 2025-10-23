part of 'create_course_cubit.dart';

@immutable
sealed class CreateCourseState {}

final class CreateCourseInitial extends CreateCourseState {}

final class CreateCourseSetupUpdated extends CreateCourseState {}

final class CreateCourseInfoUpdated extends CreateCourseState {}

class CreateCourseGoToNextTabState extends CreateCourseState {
  final int nextIndex;
  CreateCourseGoToNextTabState(this.nextIndex);
}