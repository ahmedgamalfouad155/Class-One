import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/constants/constants.dart';
import 'package:sinna/features/admin_tools/data/models/instructor_model.dart';
import 'package:sinna/features/admin_tools/data/service/instructor_service.dart';

part 'instructors_state.dart';

class InstructorsCubit extends Cubit<InstructorsState> {
  InstructorsCubit() : super(InstructorsInitial());
  final InstructorService instructorService = InstructorServiceImpl();
  StreamSubscription? _instructorsSubscription;

  void getInstructors() async {
    emit(InstructorsLoadingState());
    _instructorsSubscription = instructorService.getInstructors().listen(
      (instructors) {
        emit(InstructorsLoadedState(instructors));
      },
      onError: (e) {
        emit(InstructorsLoadFailureState(e.toString()));
      },
    );
  }

  void addInstructor(String name) async {
    emit(InstructorAddingState());
    try {
      final instructorModel = InstructorModel(
        name: name,
        id: documentIdFromLocalData(),
      );
      await instructorService.addInstructor(instructorModel);
      emit(InstructorAddedSuccessState());
    } catch (e) {
      emit(InstructorAddFailureState(e.toString()));
    }
  }

  void updateInstructor(InstructorModel instructorModel) async {
    emit(InstructorUpdatingState());
    try {
      await instructorService.updateInstructor(instructorModel);
      emit(InstructorUpdatedSuccessState(instructorModel));
    } catch (e) {
      emit(InstructorUpdateFailureState(e.toString()));
    }
  }

  void deleteInstructor(String id) async {
    emit(InstructorDeletingState());
    try {
      await instructorService.deleteInstructor(id);
      emit(InstructorDeletedSuccessState(id));
    } catch (e) {
      emit(InstructorDeleteFailureState(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _instructorsSubscription?.cancel();
    return super.close();
  }
}
