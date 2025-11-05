import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/helper/normalize_firestore_name.dart';
import 'package:sinna/features/profile/data/preferences_service.dart';
part 'preferences_state.dart';

class PreferencesCubit extends Cubit<PreferencesState> {
  PreferencesCubit() : super(PreferencesInitial());

  final PreferencesService service = PreferencesServiceImpl();
  List<String> previousSpecialties = [];

  Future<void> getSpecialty() async {
    emit(SpecialtyLoadingState());
    try {
      final specialty = await service.getSpecialty();
      previousSpecialties = specialty;
      emit(SpecialtySuccessState(specialty));
    } catch (e) {
      emit(SpecialtyFailedState(e.toString()));
    }
  }

  Future<void> getInstitutions({required String specialization}) async {
    emit(InstitutionsLoadingState());
    try {
      final institutions = await service.getInstitutions(
        specialization: normalizeFirestoreName(specialization.trim()),
      );
      emit(InstitutionsSuccessState(institutions));
    } catch (e) {
      emit(InstitutionsFailedState(e.toString()));
    }
  }

  Future<void> updateSpecialty(String specialty) async {
    return service.updateSpecialty(specialty);
  }

  Future<void> updateInstitutions(String institutions) async {
    return service.updateInstitutions(institutions);
  }

  Future<void> updateLevels(String levels) async {
    return service.updateLevels(levels);
  }
}
