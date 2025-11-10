import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/explore/data/services/course_services.dart';
import 'package:sinna/features/course_details/presentation/manager/course_cubit/course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit() : super(CourseInitial());

  final CourseServices courseServices = CourseServicesImpl();
  StreamSubscription? _courseSubscription;
    

  Future<void> getLeson({required CoursePathModel coursePathModel}) async {
    emit(CourseLoadingState());
      _courseSubscription = courseServices
          .getCourses(coursePathModel: coursePathModel)
          .listen(
            (courses) {
              emit(CourseSuccessState(courses));
            },
            onError: (e) {
              emit(CourseFailureState(e.toString()));
            },
          );
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

  @override
  Future<void> close() {
    _courseSubscription?.cancel();
    return super.close();
  }
}
