import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/auth/presentation/manager/registration_steps_cubit/registration_steps_state.dart';

enum RegistrationStep { country, university, system, level }

class RegistrationStepsCubit extends Cubit<RegistrationStepsState> {
  RegistrationStepsCubit() : super(RegistrationStepsState());

  void goToNextStep() {
    emit(state.copyWith(currentStep: state.currentStep + 1));
  }

  void resetSteps() {
    emit(RegistrationStepsState());
  }

  void selectCountry(String country) {
    emit(state.copyWith(selectedCountry: country));
    goToNextStep();
  }

  void selectUniversity(String university) {
    emit(state.copyWith(selectedUniversity: university));
    goToNextStep();
  }

  void selectSystem(String system) {
    emit(state.copyWith(selectedSystem: system));
    goToNextStep();
  }

  void selectLevel(String level) {
    emit(state.copyWith(selectedLevel: level));
    goToNextStep();
  }
}
