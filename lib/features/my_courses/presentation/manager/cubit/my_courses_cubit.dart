import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/my_courses/data/my_coursees_services.dart';
import 'package:sinna/features/my_courses/presentation/manager/cubit/my_courses_state.dart';

class MyCoursesCubit extends Cubit<MyCoursesState> {
  MyCoursesCubit() : super(MyCoursesInitial());

  final MyCourseesServices myCourseServices = MyCourseesServicesImp();
    StreamSubscription? _myCourseSubscription;


  void getMyCourses() async {
    emit(MyCoursesLoadingState());
    
       _myCourseSubscription = myCourseServices.getMyCourses().listen(
      (courses) {
        emit(MyCoursesSuccessState(courses)); 
      },
      onError: (e) {
        emit(MyCoursesFailureState(e.toString()));
      },
    );
    
  }

  
  @override
  Future<void> close() {
    _myCourseSubscription?.cancel();
    return super.close();
  }
}
