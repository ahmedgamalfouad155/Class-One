part of 'create_course_cubit.dart';

@immutable
sealed class CreateCourseState {}

final class CreateCourseInitial extends CreateCourseState {}

final class CreateCourseLoadingState extends CreateCourseState {}

final class CreateCourseSuccessState extends CreateCourseState {}

final class CreateCourseFailureState extends CreateCourseState {
  final String errMessage;
  CreateCourseFailureState(this.errMessage);
}

class CreateCourseGoToNextTabState extends CreateCourseState {
  final int nextIndex;
  CreateCourseGoToNextTabState(this.nextIndex);
}

final class EditCourseLoadingState extends CreateCourseState {}
final class EditCourseSuccessState extends CreateCourseState {}
final class EditCourseFailureState extends CreateCourseState {
  final String errMessage;
  EditCourseFailureState(this.errMessage);
}
