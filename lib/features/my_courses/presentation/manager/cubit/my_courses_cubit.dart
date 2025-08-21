import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/my_courses/data/my_coursees_services.dart';
import 'package:sinna/features/my_courses/presentation/manager/cubit/my_courses_state.dart';

class MyCoursesCubit extends Cubit<MyCoursesState> {
  MyCoursesCubit() : super(MyCoursesInitial());

  final myCourseServices = MyCourseesServicesImp();
  Future<void> getMyCourses() async {
    emit(MyCoursesLoadingState());
    try {
      final courses = await myCourseServices.getMyCourses();
      emit(MyCoursesSuccessState(courses));
    } catch (e) {
      emit(MyCoursesFailureState(e.toString()));
    }
  }
}
