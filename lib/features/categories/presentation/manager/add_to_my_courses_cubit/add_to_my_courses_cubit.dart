import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/constants/constants.dart';
import 'package:sinna/features/categories/data/models/course_path_model.dart';
import 'package:sinna/features/categories/data/services/add_to_my_courses_services.dart';
import 'package:sinna/features/categories/presentation/manager/add_to_my_courses_cubit/add_to_my_courses_state.dart';

class AddToMyCoursesCubit extends Cubit<AddToMyCoursesState> {
  AddToMyCoursesCubit() : super(AddToMyCoursesInitial());

  final service = AddToMyCoursesServicesImp();

  Future<void> addCouseToMyCourse({
    required CoursePathModel coursePathModel,
  }) async {
    emit(AddingCourseLoadingState());
    try {
      coursePathModel.update(id: documentIdFromLocalData());
      await service.addCourseToUserCouses(
        coursePathModel: coursePathModel,
      );
      emit(AddingCourseSuccessState());
    } catch (e) {
      emit(AddingCourseFailureState(e.toString()));
    }
  }
}
