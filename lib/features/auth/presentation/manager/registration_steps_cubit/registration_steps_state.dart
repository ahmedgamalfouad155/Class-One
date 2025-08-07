class RegistrationStepsState {
  final int currentStep;
  final String? selectedCountry;
  final String? selectedUniversity;
  final String? selectedSystem;
  final String? selectedLevel;

  RegistrationStepsState({
    this.currentStep = 0,
    this.selectedCountry,
    this.selectedUniversity,
    this.selectedSystem,
    this.selectedLevel,
  });

  RegistrationStepsState copyWith({
    int? currentStep,
    String? selectedCountry,
    String? selectedUniversity,
    String? selectedSystem,
    String? selectedLevel,
  }) {
    return RegistrationStepsState(
      currentStep: currentStep ?? this.currentStep,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      selectedUniversity: selectedUniversity ?? this.selectedUniversity,
      selectedSystem: selectedSystem ?? this.selectedSystem,
      selectedLevel: selectedLevel ?? this.selectedLevel,
    );
  }
}
