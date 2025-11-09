import 'package:sinna/features/auth/data/models/user_info_model.dart';

sealed class CourseParticipantsState {}

final class CourseParticipantsInitial extends CourseParticipantsState {}

final class AddingCourseToPaticipantsLoadingState
    extends CourseParticipantsState {}

final class AddingCourseToPaticipantsSuccessState
    extends CourseParticipantsState {}

final class AddingCourseToPaticipantsFailureState
    extends CourseParticipantsState {
  final String errMessage;
  AddingCourseToPaticipantsFailureState(this.errMessage);
}

final class GetingPaticipantsLoadingState extends CourseParticipantsState {}

final class GetingPaticipantsSuccessState extends CourseParticipantsState {
  final List<UserInfoModel> participants;
  GetingPaticipantsSuccessState(this.participants);
}

final class GetingPaticipantsFailureState extends CourseParticipantsState {
  final String errMessage;
  GetingPaticipantsFailureState(this.errMessage);
}

final class RemovingParticipantFromCourseLoadingState
    extends CourseParticipantsState {}

final class RemovingParticipantFromCourseSuccessState
    extends CourseParticipantsState {}

final class RemovingParticipantFromCourseFailureState
    extends CourseParticipantsState {
  final String errMessage;
  RemovingParticipantFromCourseFailureState(this.errMessage);
}
