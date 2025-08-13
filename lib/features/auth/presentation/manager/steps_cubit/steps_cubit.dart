import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/auth/presentation/manager/steps_cubit/steps_state.dart';

class StepsCubit extends Cubit<StepsState> {
  StepsCubit() : super(StepsState());

  void changeCountry(String value) {
    emit(state.copyWith(selectedCountry: value, currentStep: 1));
  }

  void changeUniversity(String value) {
    emit(state.copyWith(selectedUniversity: value, currentStep: 2));
  }

  void changeCollege(String value) {
    emit(state.copyWith(selectedCollege: value, currentStep: 3));
  }

  void changeDegree(String value) {
    emit(state.copyWith(selectedDegree: value, currentStep: 4));
  }

  void changeLevel(String value) {
    emit(state.copyWith(selectedLevel: value));
  }

  void changeStep(int step) {
    emit(state.copyWith(currentStep: step));
  }
}
