class UserModel {
  final String name;
  final String uid;
  final String email;
  final String country;
  final String university;
  final String faculty;
  final String program;
  final String stage; 
  final String specialization;
  
  UserModel({
    required this.name,
    required this.uid,
    required this.email,
    required this.country,
    required this.university,
    required this.faculty,
    required this.program,
    required this.stage, 
    required this.specialization,
  });

  factory UserModel.empty() {
    return UserModel(
      name: '',
      uid: '',
      email: '',
      country: '',
      university: '',
      faculty: '',
      program: '',
      stage: '', 
      specialization: '',
    );
  }

  UserModel copyWith({
    String? name,
    String? uid,
    String? email,
    String? country,
    String? university,
    String? faculty,
    String? program,
    String? stage,
    String? specialization,
  }) {
    return UserModel(
      name: name ?? this.name,
      uid: uid ?? this.uid,
      email: email ?? this.email,
      country: country ?? this.country,
      university: university ?? this.university,
      faculty: faculty ?? this.faculty,
      program: program ?? this.program,
      stage: stage ?? this.stage,
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
      'faculty': faculty,
      'program': program,
      'stage': stage,
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
      faculty: map['college'] ?? '',
      program: map['system'] ?? '',
      stage: map['level'] ?? '',
      specialization: map['specialization'] ?? '',
    );
  }
}
