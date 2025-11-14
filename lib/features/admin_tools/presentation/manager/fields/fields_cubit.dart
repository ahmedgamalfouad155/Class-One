import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/admin_tools/data/models/field_model.dart';
import 'package:sinna/features/admin_tools/data/service/fields_service.dart';
part 'fields_state.dart';

class FieldsCubit extends Cubit<FieldsState> {
  FieldsCubit() : super(FieldsInitial());
  final FieldsServiceImpl fieldsService = FieldsServiceImpl();
  StreamSubscription? _fieldsSubscription;

  Stream<List<FieldModel>> getFields() {
    emit(FieldsLoadingState());
    _fieldsSubscription = fieldsService.getFields().listen(
      (fields) {
        emit(FieldsSuccessState(fields));
      },
      onError: (e) {
        emit(FieldsFailureState(e.toString()));
      },
    );
    return fieldsService.getFields();
  }

  void addField(String specialization) async {
    emit(AddingFieldsLoadingState());
    try {
      await FieldsServiceImpl().addField(specialization);
      emit(AddingFieldsSuccessState());
    } catch (e) {
      emit(AddingFieldsFailureState(e.toString()));
    }
  }

  void updateField(FieldModel fieldModel) async {
    emit(UpdatingFieldLoadingState());
    try {
      await fieldsService.updateField(fieldModel);
      emit(UpdatingFieldSuccessState());
    } catch (e) {
      emit(UpdatingFieldFailureState(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _fieldsSubscription?.cancel();
    return super.close();
  }
}
