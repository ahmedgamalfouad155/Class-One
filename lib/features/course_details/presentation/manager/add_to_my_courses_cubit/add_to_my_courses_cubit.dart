import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/constants/constants.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/explore/data/services/add_to_my_courses_services.dart';
import 'package:sinna/features/course_details/presentation/manager/add_to_my_courses_cubit/add_to_my_courses_state.dart';

class AddToMyCoursesCubit extends Cubit<AddToMyCoursesState> {
  AddToMyCoursesCubit() : super(AddToMyCoursesInitial());

  final service = AddToMyCoursesServicesImp();

  Future<void> addCouseToMyCourse({
    required CoursePathModel coursePathModel,
    required String email,
  }) async {
    emit(AddingCourseLoadingState());
    bool usersIsExist = false;
    if (email.isNotEmpty) {
      usersIsExist = await service.checkUserExists(email);
    }
    try {
      if (usersIsExist) {
        coursePathModel.update(id: documentIdFromLocalData());
        await service.addCourseToUserCouses(
          coursePathModel: coursePathModel,
          email: email,
        );
        emit(AddingCourseSuccessState());
      } else {
        emit(AddingCourseFailureState("User not found"));
      }
    } catch (e) {
      emit(AddingCourseFailureState(e.toString()));
    }
  }
}
