import 'package:flutter_bloc/flutter_bloc.dart';
import 'steps_state.dart';

class StepsCubit extends Cubit<StepsState> {
  StepsCubit() : super(StepsState());

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
