part of 'academic_info_update_cubit.dart';

@immutable
sealed class AcademicInfoUpdateState {}

final class AcademicInfoUpdateInitial extends AcademicInfoUpdateState {}

final class AcademicInfoUpdateLoadingState extends AcademicInfoUpdateState {}

final class AcademicInfoUpdateSuccessState extends AcademicInfoUpdateState {}

final class AcademicInfoUpdateFailureState extends AcademicInfoUpdateState {
  final String errMessage;
  AcademicInfoUpdateFailureState(this.errMessage);
}
