part of 'preferences_cubit.dart';

@immutable
sealed class PreferencesState {}

final class PreferencesInitial extends PreferencesState {}

final class SpecialtyLoadingState extends PreferencesState {}

final class SpecialtyLoadedState extends PreferencesState {
  final List<String> specialty;
  SpecialtyLoadedState(this.specialty);
}

  final class SpecialtyLoadingFailedState extends PreferencesState {
  final String errorMessage;
  SpecialtyLoadingFailedState(this.errorMessage);
}


final class InstitutionsLoadingState extends PreferencesState {}

final class InstitutionsLoadedState extends PreferencesState {
  final List<String> institutions;
  InstitutionsLoadedState(this.institutions);
}

  final class InstitutionsLoadingFailedState extends PreferencesState {
  final String errorMessage;
  InstitutionsLoadingFailedState(this.errorMessage);
}
