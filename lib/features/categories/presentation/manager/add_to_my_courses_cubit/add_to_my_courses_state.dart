
sealed class AddToMyCoursesState {}

final class AddToMyCoursesInitial extends AddToMyCoursesState {}
final class AddingCourseLoadingState extends AddToMyCoursesState {} 
final class AddingCourseSuccessState extends AddToMyCoursesState {} 
final class AddingCourseFailureState extends AddToMyCoursesState {
  final String errMessage;
  AddingCourseFailureState(this.errMessage);
} 
