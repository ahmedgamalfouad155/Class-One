/// ✅ الموديل الأكاديمي - بيانات دراسية
class UserAcademicModel {
  final String? country;
  final String? university;
  final String? faculty;
  final String? program;
  final String? stage;
  final String? specialization;

  UserAcademicModel({
    this.country,
    this.university,
    this.faculty,
    this.program,
    this.stage,
    this.specialization,
  });

  factory UserAcademicModel.empty() {
    return UserAcademicModel(
      country: '',
      university: '',
      faculty: '',
      program: '',
      stage: '',
      specialization: '',
    );
  }

  UserAcademicModel copyWith({
    String? country,
    String? university,
    String? faculty,
    String? program,
    String? stage,
    String? specialization,
  }) {
    return UserAcademicModel(
      country: country ?? this.country,
      university: university ?? this.university,
      faculty: faculty ?? this.faculty,
      program: program ?? this.program,
      stage: stage ?? this.stage,
      specialization: specialization ?? this.specialization,
    );
  }

  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{};
    if (country != null && country!.isNotEmpty) data['country'] = country;
    if (university != null && university!.isNotEmpty) data['university'] = university;
    if (faculty != null && faculty!.isNotEmpty) data['faculty'] = faculty;
    if (program != null && program!.isNotEmpty) data['program'] = program;
    if (stage != null && stage!.isNotEmpty) data['stage'] = stage;
    if (specialization != null && specialization!.isNotEmpty) data['specialization'] = specialization;
    return data;
  }

  factory UserAcademicModel.fromMap(Map<String, dynamic> map) {
    return UserAcademicModel(
      country: map['country'],
      university: map['university'],
      faculty: map['faculty'],
      program: map['program'],
      stage: map['stage'],
      specialization: map['specialization'],
    );
  }
}

