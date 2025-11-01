import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/profile/data/preferences_service.dart';
part 'preferences_state.dart';

class PreferencesCubit extends Cubit<PreferencesState> {
  PreferencesCubit() : super(PreferencesInitial());

  final PreferencesService service = PreferencesServiceImpl();
  String? selectedSpecialty;

  Future<void> getSpecialty() async {
    emit(SpecialtyLoadingState());
    try {
      final specialty = await service.getSpecialty();
      emit(SpecialtyLoadedState(specialty));
    } catch (e) {
      emit(SpecialtyLoadingFailedState(e.toString()));
    }
  }

  void selectSpecialty(String specialty) {
    selectedSpecialty = specialty;
    emit(SpecialtySelectedState(specialty));
    getInstitutions(specialization: specialty);
  }

  Future<void> getInstitutions({required String specialization}) async {
  emit(InstitutionsLoadingState());
  try {
    final institutions = await service.getInstitutions(specialization: specialization);
    emit(InstitutionsLoadedState(institutions));
  } catch (e) {
    emit(InstitutionsLoadingFailedState(e.toString()));
  }
}

}
