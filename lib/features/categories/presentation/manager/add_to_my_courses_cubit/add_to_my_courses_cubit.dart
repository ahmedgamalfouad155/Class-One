import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/constants/constants.dart';
import 'package:sinna/features/categories/data/models/adding_course_model.dart';
import 'package:sinna/features/categories/data/models/course_path_model.dart';
import 'package:sinna/features/categories/data/services/add_to_my_courses_services.dart';
import 'package:sinna/features/categories/presentation/manager/add_to_my_courses_cubit/add_to_my_courses_state.dart';

class AddToMyCoursesCubit extends Cubit<AddToMyCoursesState> {
  AddToMyCoursesCubit() : super(AddToMyCoursesInitial());

  final service = AddToMyCoursesServicesImp();
  final addingCoursePath = AddingCourseModel();

  Future<void> addCouseToMyCourse({
    required CoursePathModel coursePathModel,
  }) async {
    emit(AddingCourseLoadingState());
    addingCoursePath.update(
      country: coursePathModel.country,
      university: coursePathModel.university,
      faculty: coursePathModel.faculty,
      program: coursePathModel.program,
      stage: coursePathModel.stage,
      subject: coursePathModel.subject,
      term: coursePathModel.term,
    );
    try {
      addingCoursePath.update(id: documentIdFromLocalData());
      await service.addCourseToUserCouses(addingCourseModel: addingCoursePath);
      emit(AddingCourseSuccessState());
    } catch (e) {
      emit(AddingCourseFailureState(e.toString()));
    }
  }
}
