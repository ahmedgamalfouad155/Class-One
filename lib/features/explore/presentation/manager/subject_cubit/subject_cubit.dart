import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart'; 
import 'package:sinna/features/explore/data/services/subject_service.dart';
import 'package:sinna/features/explore/presentation/manager/subject_cubit/subject_state.dart';

class SubjectCubit extends Cubit<SubjectState> {
  SubjectCubit() : super(SubjectInitial());

  final SubjectService subjectService = SubjectServiceImpl();

  Future<void> getSubjects(CoursePathModel path) async {
    emit(SubjectLoadingState());
    try {
      final subjects = await subjectService.getSubjects(path);
      emit(SubjectSuccessState(subjects));
    } catch (e) {
      emit(SubjectFailureState(e.toString()));
    }
  }
}
