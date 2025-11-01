import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/profile/data/preferences_service.dart';
part 'preferences_state.dart';

class PreferencesCubit extends Cubit<PreferencesState> {
  PreferencesCubit() : super(PreferencesInitial());

  final PreferencesService service = PreferencesServiceImpl();

  Future<void> getSpecialty() async {
    emit(SpecialtyLoadingState());
    try {
      final specialty = await service.getSpecialty();
      emit(SpecialtyLoadedState(specialty));
    } catch (e) { 
      emit(SpecialtyLoadingFailedState(e.toString()));
    }
  }

  Future<void> getInstitutions() async {
    emit(InstitutionsLoadingState());
    try {
      final institutions = await service.getInstitutions(specialization: "dentistry");
      emit(InstitutionsLoadedState(institutions));
    } catch (e) {
      emit(InstitutionsLoadingFailedState(e.toString()));
    }
  }

}
