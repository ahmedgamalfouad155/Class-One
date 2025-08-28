// class UserModel {
//   final String? name;
//   final String? uid;
//   final String? email;
//   final String? country;
//   final String? university;
//   final String? faculty;
//   final String? program;
//   final String? stage;
//   final String? specialization;

//   UserModel({
//     this.name,
//     this.uid,
//     this.email,
//     this.country,
//     this.university,
//     this.faculty,
//     this.program,
//     this.stage,
//     this.specialization,
//   });
//   factory UserModel.empty() {
//     return UserModel(
//       name: '',
//       uid: '',
//       email: '',
//       country: '',
//       university: '',
//       faculty: '',
//       program: '',
//       stage: '',
//       specialization: '',
//     );
//   }

//   UserModel copyWith({
//     String? name,
//     String? uid,
//     String? email,
//     String? country,
//     String? university,
//     String? faculty,
//     String? program,
//     String? stage,
//     String? specialization,
//   }) {
//     return UserModel(
//       name: name ?? this.name,
//       uid: uid ?? this.uid,
//       email: email ?? this.email,
//       country: country ?? this.country,
//       university: university ?? this.university,
//       faculty: faculty ?? this.faculty,
//       program: program ?? this.program,
//       stage: stage ?? this.stage,
//       specialization: specialization ?? this.specialization,
//     );
//   }

//   /// ✅ toMap ما بيرفعش null أو قيم فاضية
//   Map<String, dynamic> toMap() {
//     final data = <String, dynamic>{};

//     if (name != null && name!.isNotEmpty) data['name'] = name;
//     if (uid != null && uid!.isNotEmpty) data['uid'] = uid;
//     if (email != null && email!.isNotEmpty) data['email'] = email;
//     if (country != null && country!.isNotEmpty) data['country'] = country;
//     if (university != null && university!.isNotEmpty) {
//       data['university'] = university;
//     }
//     if (faculty != null && faculty!.isNotEmpty) data['faculty'] = faculty;
//     if (program != null && program!.isNotEmpty) data['program'] = program;
//     if (stage != null && stage!.isNotEmpty) data['stage'] = stage;
//     if (specialization != null && specialization!.isNotEmpty) {
//       data['specialization'] = specialization;
//     }

//     return data;
//   }

//   factory UserModel.fromMap(Map<String, dynamic> map, String documentId) {
//     return UserModel(
//       name: map['name'],
//       uid: documentId,
//       email: map['email'],
//       country: map['country'],
//       university: map['university'],
//       faculty: map['faculty'],
//       program: map['program'],
//       stage: map['stage'],
//       specialization: map['specialization'],
//     );
//   }
// }
