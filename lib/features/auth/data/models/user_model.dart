class UserModel {
  final String name;
  final String uid;
  final String email;
  final String country;
  final String university;
  final String system;
  final String level;
  final String college;
  final String specialization;

  UserModel({
    required this.name,
    required this.uid,
    required this.email,
    required this.country,
    required this.university,
    required this.system,
    required this.level,
    required this.college,
    required this.specialization,
  });

  factory UserModel.empty() {
    return UserModel(
      name: '',
      uid: '',
      email: '',
      country: '',
      university: '',
      system: '',
      level: '',
      college: '',
      specialization: '',
    );
  }

  UserModel copyWith({
    String? name,
    String? uid,
    String? email,
    String? country,
    String? university,
    String? system,
    String? level,
    String? college,
    String? specialization,
  }) {
    return UserModel(
      name: name ?? this.name,
      uid: uid ?? this.uid,
      email: email ?? this.email,
      country: country ?? this.country,
      university: university ?? this.university,
      system: system ?? this.system,
      level: level ?? this.level,
      college: college ?? this.college,
      specialization: specialization ?? this.specialization,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uid': uid,
      'email': email,
      'country': country,
      'university': university,
      'system': system,
      'level': level,
      'college': college,
      'specialization': specialization,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map, String documentId) {
    return UserModel(
      name: map['name'] ?? '',
      uid: documentId,
      email: map['email'] ?? '',
      country: map['country'] ?? '',
      university: map['university'] ?? '',
      system: map['system'] ?? '',
      level: map['level'] ?? '',
      college: map['college'] ?? '',
      specialization: map['specialization'] ?? '',
    );
  }
}
