import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/auth/data/models/user_academic_model.dart';
import 'package:sinna/features/profile/data/academic_info_service.dart';

part 'academic_info_update_state.dart';

class AcademicInfoUpdateCubit extends Cubit<AcademicInfoUpdateState> {
  AcademicInfoUpdateCubit() : super(AcademicInfoUpdateInitial());
  final AcademicInfoService service = AcademicInfoServiceImpl();

  Future<void> updateAcademicInfo(UserAcademicModel userAcademicModel) async {
    emit(AcademicInfoUpdateLoadingState());
    try { 
      await service.updateAcademicInfo(userAcademicModel);
      emit(AcademicInfoUpdateSuccessState());
    } catch (e) {
      emit(AcademicInfoUpdateFailureState(e.toString()));
    }
  }
}
