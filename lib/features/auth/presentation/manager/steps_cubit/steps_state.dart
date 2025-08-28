class StepsState {
  final String? country;
  final String? university;
  final String? faculty;
  final String? program;
  final String? stage;
  final String? specialization;

  StepsState({
    this.country,
    this.university,
    this.faculty,
    this.program,
    this.stage,
    this.specialization,
  });

  StepsState update({
    String? country,
    String? university,
    String? faculty,
    String? program,
    String? stage,
    String? specialization,
  }) {
    return StepsState(
      country: country ?? this.country,
      university: university ?? this.university,
      faculty: faculty ?? this.faculty,
      program: program ?? this.program,
      stage: stage ?? this.stage,
      specialization: specialization ?? this.specialization,
    );
  }
}

class StepsInitial extends StepsState {}

class StepsAddedSuccessState extends StepsState {}

  class StepsAddedFailedState extends StepsState {
  final String error;
  StepsAddedFailedState(this.error);
}
