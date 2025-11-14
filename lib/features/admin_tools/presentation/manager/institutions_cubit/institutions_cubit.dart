import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/admin_tools/data/models/institution_model.dart';
import 'package:sinna/features/admin_tools/data/service/institutions_service.dart';

part 'institutions_state.dart';

class InstitutionsCubit extends Cubit<InstitutionsState> {
  InstitutionsCubit() : super(InstitutionsInitial());
  final InstitutionService institutionService = InstitutionServiceImpl();
  StreamSubscription? _institutionsSubscription;

  void getInstitutions({required String specializationId}) async {
    emit(InstitutionsLoadingState());
    _institutionsSubscription = institutionService
        .getInstitutions(specialization: specializationId)
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
    required String specializationId,
    required String institutionname,
  }) async {
    emit(InstitutionAddingState());
    try {
      await institutionService.addInstitution(
        institution: institutionname,
        specializationid: specializationId,
      );
      emit(InstitutionAddedSuccessState());
    } catch (e) {
      emit(InstitutionAddFailureState(e.toString()));
    }
  }

  void updateInstitution({
    required String specializationId,
    required InstitutionModel institutionModel,
  }) async {
    emit(InstitutionUpdatingState());
    try {
      await institutionService.updateInstitution(
        specializationId,
        institutionModel,
      );
      emit(InstitutionUpdatedSuccessState(institutionModel));
    } catch (e) {
      emit(InstitutionUpdateFailureState(e.toString()));
    }
  }

  // void deleteInstitution({
  //   required String specializationId,
  //   required String institutionId,
  // }) async {
  //   emit(InstitutionDeletingState());
  //   try {
  //     await institutionService.deleteInstitution( 
  //       specializationId: specializationId,
  //       institutionId: institutionId,
  //     );
  //     emit(InstitutionDeletedSuccessState());
  //   } catch (e) {
  //     emit(InstitutionDeleteFailureState(e.toString()));
  //   }
  // }

  @override
  Future<void> close() {
    _institutionsSubscription?.cancel();
    return super.close();
  }
}
