import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/helper/normalize_firestore_name.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/course_details/data/services/course_participants_services.dart';
import 'package:sinna/features/course_details/presentation/manager/course_participants_cubit/course_participants_state.dart';

class CourseParticipantsCubit extends Cubit<CourseParticipantsState> {
  CourseParticipantsCubit() : super(CourseParticipantsInitial());

  final service = CourseParticipantsServicesImp();
  StreamSubscription? _participantsSubscription;

  Future<void> addCouseToMyCourse({
    required CoursePathModel coursePathModel,
    required String email,
  }) async {
    emit(AddingCourseToPaticipantsLoadingState());
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

        emit(AddingCourseToPaticipantsSuccessState());
      } else {
        emit(AddingCourseToPaticipantsFailureState("User not found"));
      }
    } catch (e) {
      emit(AddingCourseToPaticipantsFailureState(e.toString()));
    }
  }

  Future<void> getParticipants(CoursePathModel coursePathModel) async {
    emit(GetingPaticipantsLoadingState());
    _participantsSubscription = service
        .getParticipants(coursePathModel)
        .listen(
          (participants) {
            emit(GetingPaticipantsSuccessState(participants));
          },
          onError: (e) {
            emit(GetingPaticipantsFailureState(e.toString()));
          },
        );
  }

  Future<void> removeParticipantFromCourse(
    String email,
    CoursePathModel coursePathModel,
  ) async {
    emit(RemovingParticipantFromCourseLoadingState());
    try {
      await service.removeParticipantFromCourse(email, coursePathModel);
      emit(RemovingParticipantFromCourseSuccessState());
    } catch (e) {
      emit(RemovingParticipantFromCourseFailureState(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _participantsSubscription?.cancel();
    return super.close();
  }
}
