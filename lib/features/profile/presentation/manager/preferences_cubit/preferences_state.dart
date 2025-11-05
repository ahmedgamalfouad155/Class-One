part of 'preferences_cubit.dart';

@immutable
sealed class PreferencesState {}

final class PreferencesInitial extends PreferencesState {}

final class SpecialtyLoadingState extends PreferencesState {}

final class SpecialtySuccessState extends PreferencesState {
  final List<String> specialty;
  SpecialtySuccessState(this.specialty);
}

final class SpecialtyFailedState extends PreferencesState {
  final String errorMessage;
  SpecialtyFailedState(this.errorMessage);
}

final class InstitutionsLoadingState extends PreferencesState {}

final class InstitutionsSuccessState extends PreferencesState {
  final List<String> institutions;
  InstitutionsSuccessState(this.institutions);
}

final class InstitutionsFailedState extends PreferencesState {
  final String errorMessage;
  InstitutionsFailedState(this.errorMessage);
}
