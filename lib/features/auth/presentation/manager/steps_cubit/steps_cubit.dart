import 'package:flutter_bloc/flutter_bloc.dart';
import 'steps_state.dart';

class StepsCubit extends Cubit<StepsState> {
  StepsCubit() : super(StepsState());
  void selectCountry(String country) {
    emit(
      state.copyWith(
        country: country,
        university: null,
        faculty: null,
        program: null,
        level: null,
        specialization: null,
      ),
    );
  }

  void selectUniversity(String university) {
    emit(
      state.copyWith(
        university: university,
        faculty: null,
        program: null,
        level: null,
        specialization: null,
      ),
    );
  }

  void selectFaculty(String faculty) {
    emit(
      state.copyWith(
        faculty: faculty,
        program: null,
        level: null,
        specialization: null,
      ),
    );
  }

  void selectProgram(String program) {
    emit(state.copyWith(program: program, level: null, specialization: null));
  }

  void selectLevel(String level) {
    emit(state.copyWith(level: level, specialization: null));
  }

  void selectSpecialization(String value) {
    emit(state.copyWith(specialization: value));
  }
}
