import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/auth/data/models/user_academic_model.dart';
import 'package:sinna/features/auth/data/services/steps_service/steps_service.dart';
import 'steps_state.dart';

class StepsCubit extends Cubit<StepsState> {
  StepsCubit() : super(StepsState());

  final StepsService authServices = StepsServiceImpl();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> addAcadimyInfo(UserAcademicModel userAcademicModel) async {
    try {
      await authServices.addAcadimyInfo(userAcademicModel);
      emit(StepsAddedSuccessState());
    } catch (e) {
      emit(StepsAddedFailedState(e.toString()));
    }
  }

  void selectCountry(String country) {
    emit(
      StepsState(
        country: country,
        university: "null",
        faculty: "null",
        program: "null",
        stage: "null",
        specialization: "null",
      ),
    );
  }

  void selectUniversity(String university) {
    emit(
      state.update(
        university: university,
        faculty: "null",
        program: "null",
        stage: "null",
        specialization: "null",
      ),
    );
  }

  void selectFaculty(String faculty) {
    emit(
      state.update(
        faculty: faculty,
        program: "null",
        stage: "null",
        specialization: "null",
      ),
    );
  }

  void selectProgram(String program) {
    emit(state.update(program: program, stage: "null", specialization: "null"));
  }

  void selectStage(String stage) {
    emit(state.update(stage: stage, specialization: "null"));
  }

  void selectSpecialization(String specialization) {
    emit(state.update(specialization: specialization));
  }
}
