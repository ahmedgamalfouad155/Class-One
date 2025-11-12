import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/helper/normalize_firestore_name.dart';
import 'package:sinna/features/admin_tools/data/models/institution_model.dart';
import 'package:sinna/features/admin_tools/data/service/institutions_service.dart';

part 'institutions_state.dart';

class InstitutionsCubit extends Cubit<InstitutionsState> {
  InstitutionsCubit() : super(InstitutionsInitial());
  final InstitutionService institutionService = InstitutionServiceImpl();
  StreamSubscription? _institutionsSubscription;

  void getInstitutions({required String specialization}) async {
    emit(InstitutionsLoadingState());
    _institutionsSubscription = institutionService
        .getInstitutions(specialization: specialization)
        .listen(
          (institutions) {
            emit(InstitutionsLoadedState(institutions));
          },
          onError: (e) {
            emit(InstitutionsLoadFailureState(e.toString()));
          },
        );
  }

  void addInstitution({
    required String specialization,
    required String institutionname,
  }) async {
    emit(InstitutionAddingState());
    try {
      final institutionModel = InstitutionModel(
        name: institutionname,
        id: documentIdFromLocalData(),
      );
      await institutionService.addInstitution(
        institution: institutionname,
        specialization: specialization,
        institutionModel: institutionModel,
      );
      emit(InstitutionAddedSuccessState());
    } catch (e) {
      emit(InstitutionAddFailureState(e.toString()));
    }
  }

  void updateInstitution(InstitutionModel institutionModel) async {
    emit(InstitutionUpdatingState());
    try {
      await institutionService.updateInstitution(institutionModel);
      emit(InstitutionUpdatedSuccessState(institutionModel));
    } catch (e) {
      emit(InstitutionUpdateFailureState(e.toString()));
    }
  }

  void deleteInstitution(String id) async {
    emit(InstitutionDeletingState());
    try {
      await institutionService.deleteInstitution(id);
      emit(InstitutionDeletedSuccessState(id));
    } catch (e) {
      emit(InstitutionDeleteFailureState(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _institutionsSubscription?.cancel();
    return super.close();
  }
}
