import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/explore/data/services/subject_service.dart';
import 'package:sinna/features/explore/presentation/manager/subject_cubit/subject_state.dart';

class SubjectCubit extends Cubit<SubjectState> {
  SubjectCubit() : super(SubjectInitial());

  final SubjectService subjectService = SubjectServiceImpl();
  StreamSubscription? _subjectsSubscription;

  Future<void> getSubjects(CoursePathModel path) async {
    emit(SubjectLoadingState());
    _subjectsSubscription = subjectService
        .getSubjects(path)
        .listen(
          (subjects) {
            emit(SubjectSuccessState(subjects));
          },
          onError: (e) {
            emit(SubjectFailureState(e.toString()));
          },
        );
  }

  @override
  Future<void> close() {
    _subjectsSubscription?.cancel();
    return super.close();
  }
}
