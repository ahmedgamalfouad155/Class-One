import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/categories/data/models/course_path_model.dart';
import 'package:sinna/features/categories/data/services/course_services.dart';
import 'package:sinna/features/categories/presentation/manager/course_cubit/course_state.dart';

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


}
