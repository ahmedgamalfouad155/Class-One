class UserInfoModel {
  final String? uid;
  final String? name;
  final String? email;
  final String? deviceId;

  UserInfoModel({this.uid, this.name, this.email, this.deviceId});

  factory UserInfoModel.empty() {
    return UserInfoModel(uid: '', name: '', email: '', deviceId: '');
  }

  UserInfoModel copyWith({
    String? uid,
    String? name,
    String? email,
    String? deviceId,
  }) {
    return UserInfoModel(
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

  factory UserInfoModel.fromMap(Map<String, dynamic> map, String documentId) {
    return UserInfoModel(
      uid: documentId,
      name: map['name'],
      email: map['email'],
      deviceId: map['deviceId'],
    );
  }
}
