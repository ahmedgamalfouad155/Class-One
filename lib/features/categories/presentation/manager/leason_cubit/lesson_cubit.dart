import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/categories/data/models/course_path_model.dart';
import 'package:sinna/features/categories/data/services/leson_services.dart';
import 'package:sinna/features/categories/presentation/manager/leason_cubit/lesson_state.dart';

class LessonCubit extends Cubit<LessonState> {
  LessonCubit() : super(LessonInitial());

  final LesonServices lesonServices = LesonServicesImpl();

  Future<void> getLeson({required CoursePathModel lessonPathModel}) async {
    emit(LessonLoadingState());
    try {
      final leson = await lesonServices.getLesons(
        country: lessonPathModel.country.toString(),
        university: lessonPathModel.university.toString(),
        system: lessonPathModel.system.toString(),
        level: lessonPathModel.level.toString(),
        subject: lessonPathModel.subject.toString(),
        term: lessonPathModel.term.toString(),
        doctor: lessonPathModel.doctor.toString(),
      );
      emit(LessonSuccessState(leson));
    } catch (e) {
      emit(LessonFailureState(e.toString()));
    }
  }
}
