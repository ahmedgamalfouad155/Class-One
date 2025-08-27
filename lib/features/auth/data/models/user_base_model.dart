/// ✅ الموديل الأساسي - بيانات عامة عن المستخدم
class UserBaseModel {
  final String? uid;
  final String? name;
  final String? email;

  UserBaseModel({
    this.uid,
    this.name,
    this.email,
  });

  factory UserBaseModel.empty() {
    return UserBaseModel(
      uid: '',
      name: '',
      email: '',
    );
  }

  UserBaseModel copyWith({
    String? uid,
    String? name,
    String? email,
  }) {
    return UserBaseModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{};
    if (uid != null && uid!.isNotEmpty) data['uid'] = uid;
    if (name != null && name!.isNotEmpty) data['name'] = name;
    if (email != null && email!.isNotEmpty) data['email'] = email;
    return data;
  }

  factory UserBaseModel.fromMap(Map<String, dynamic> map, String documentId) {
    return UserBaseModel(
      uid: documentId,
      name: map['name'],
      email: map['email'],
    );
  }
}

// ✅ موديل جامع بين الأساسي + الأكاديمي

// class UserModel {
//   final UserBaseModel base;
//   final UserAcademicModel academic; 
//   UserModel({
//     required this.base,
//     required this.academic,
//   }); 
//   factory UserModel.empty() {
//     return UserModel(
//       base: UserBaseModel.empty(),
//       academic: UserAcademicModel.empty(),
//     );
//   } 
//   UserModel copyWith({
//     UserBaseModel? base,
//     UserAcademicModel? academic,
//   }) {
//     return UserModel(
//       base: base ?? this.base,
//       academic: academic ?? this.academic,
//     );
//   } 
//   Map<String, dynamic> toMap() {
//     return {
//       ...base.toMap(),
//       ...academic.toMap(),
//     };
//   } 
//   factory UserModel.fromMap(Map<String, dynamic> map, String documentId) {
//     return UserModel(
//       base: UserBaseModel.fromMap(map, documentId),
//       academic: UserAcademicModel.fromMap(map),
//     );
//   }
// }
