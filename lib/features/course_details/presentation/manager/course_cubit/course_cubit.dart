import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/explore/data/services/course_services.dart';
import 'package:sinna/features/course_details/presentation/manager/course_cubit/course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit() : super(CourseInitial());

  final CourseServices courseServices = CourseServicesImpl();

  Future<void> getLeson({required CoursePathModel coursePathModel}) async {
    emit(CourseLoadingState());
    try {
      final leson = await courseServices.getCourses(
        coursePathModel: coursePathModel,
      ); 
      emit(CourseSuccessState(leson));
    } catch (e) {
      emit(CourseFailureState(e.toString()));
    }
  }

  Future<void> deleteCourse(CoursePathModel coursePathModel) async {
    emit(CourseDeleteLoadingState());
    try {
      await courseServices.deleteCourse(coursePathModel);
      emit(CourseDeleteSuccessState());
    } catch (e) {
      emit(CourseFailureState(e.toString()));
    }
  }
}
