class StepsState {
  final String? selectedCountry;
  final String? selectedUniversity;
  final String? selectedCollege;
  final String? selectedDegree;
  final String? selectedLevel;
  final int currentStep;

  StepsState({
    this.selectedCountry,
    this.selectedUniversity,
    this.selectedCollege,
    this.selectedDegree,
    this.selectedLevel,
    this.currentStep = 0,
  });

  StepsState copyWith({
    String? selectedCountry,
    String? selectedUniversity,
    String? selectedCollege,
    String? selectedDegree,
    String? selectedLevel,
    int? currentStep,
  }) {
    return StepsState(
      selectedCountry: selectedCountry ?? this.selectedCountry,
      selectedUniversity: selectedUniversity ?? this.selectedUniversity,
      selectedCollege: selectedCollege ?? this.selectedCollege,
      selectedDegree: selectedDegree ?? this.selectedDegree,
      selectedLevel: selectedLevel ?? this.selectedLevel,
      currentStep: currentStep ?? this.currentStep,
    );
  }
}
