
class UserAcademicModel {
  final String? university;
  final String? program;
  final String? level;
  final String? specialization;

  UserAcademicModel({
    this.university,
    this.program,
    this.level,
    this.specialization,
  });

  UserAcademicModel copyWith({
    String? university,
    String? program,
    String? level,
    String? specialization,
  }) {
    return UserAcademicModel(
      university: university ?? this.university,
      program: program ?? this.program,
      level: level ?? this.level,
      specialization: specialization ?? this.specialization,
    );
  }

  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{};
    if (university != null && university!.isNotEmpty) {
      data['university'] = university;
    }
    if (program != null && program!.isNotEmpty) data['program'] = program;
    if (level != null && level!.isNotEmpty) data['level'] = level;
    if (specialization != null && specialization!.isNotEmpty) {
      data['specialization'] = specialization;
    }
    return data;
  }

  factory UserAcademicModel.fromMap(Map<String, dynamic> map) { 
    return UserAcademicModel(
      university: map['university'],
      program: map['program'],
      level: map['level'],
      specialization: map['specialization'],
    );
  }
}
