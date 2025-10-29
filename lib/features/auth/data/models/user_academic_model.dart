import 'package:sinna/core/constants/constants.dart';

class UserAcademicModel {
  final String? institution;
  final String? level;
  final String? specialization;

  UserAcademicModel({this.institution, this.level, this.specialization});

  UserAcademicModel copyWith({
    String? institution,
    String? level,
    String? specialization,
  }) {
    return UserAcademicModel(
      institution: institution ?? this.institution,
      level: level ?? this.level,
      specialization: specialization ?? this.specialization,
    );
  }

  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{};
    if (institution != null && institution!.isNotEmpty) {
      data[FireStoreFilterFieldsName.institution] = institution;
    }
    if (level != null && level!.isNotEmpty) {
      data[FireStoreFilterFieldsName.level] = level;
    }
    if (specialization != null && specialization!.isNotEmpty) {
      data[FireStoreFilterFieldsName.specialization] = specialization;
    }
    return data;
  }

  factory UserAcademicModel.fromMap(Map<String, dynamic> map) {
    return UserAcademicModel(
      institution: map[FireStoreFilterFieldsName.institution],
      level: map[FireStoreFilterFieldsName.level],
      specialization: map[FireStoreFilterFieldsName.specialization],
    );
  }
}
