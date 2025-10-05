/// ✅ الموديل الأساسي - بيانات عامة عن المستخدم
class UserBaseModel {
  final String? uid;
  final String? name;
  final String? email;
  final String? deviceId;

  UserBaseModel({
    this.uid,
    this.name,
    this.email,
    this.deviceId,
  });

  factory UserBaseModel.empty() {
    return UserBaseModel(
      uid: '',
      name: '',
      email: '',
      deviceId: '',
    );
  }

  UserBaseModel copyWith({
    String? uid,
    String? name,
    String? email,
    String? deviceId,
  }) {
    return UserBaseModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
        deviceId: deviceId ?? this.deviceId,
    );
  }

  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{};
    if (uid != null && uid!.isNotEmpty) data['uid'] = uid;
    if (name != null && name!.isNotEmpty) data['name'] = name;
    if (email != null && email!.isNotEmpty) data['email'] = email;
    if (deviceId != null && deviceId!.isNotEmpty) data['deviceId'] = deviceId;
    return data;
  }

  factory UserBaseModel.fromMap(Map<String, dynamic> map, String documentId) {
    return UserBaseModel(
      uid: documentId,
      name: map['name'],
      email: map['email'],
      deviceId: map['deviceId'],
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
