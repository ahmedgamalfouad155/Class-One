import 'package:sinna/core/constants/constants.dart';

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
    if (uid != null && uid!.isNotEmpty) {
      data[FireStoreUserInfoFieldsName.uid] = uid;
    }
    if (name != null && name!.isNotEmpty) {
      data[FireStoreUserInfoFieldsName.name] = name;
    }
    if (email != null && email!.isNotEmpty) {
      data[FireStoreUserInfoFieldsName.email] = email;
    }
    if (deviceId != null && deviceId!.isNotEmpty) {
      data[FireStoreUserInfoFieldsName.deviceId] = deviceId;
    }
    return data;
  }

  factory UserInfoModel.fromMap(Map<String, dynamic> map, String documentId) {
    return UserInfoModel(
      uid: documentId,
      name: map[FireStoreUserInfoFieldsName.name],
      email: map[FireStoreUserInfoFieldsName.email],
      deviceId: map[FireStoreUserInfoFieldsName.deviceId],
    );
  }
}
