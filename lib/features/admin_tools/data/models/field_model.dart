import 'package:sinna/core/constants/constants.dart';

class FieldModel {
  final String id;
  final String name;

  FieldModel({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      FireStoreInstructorFieldsName.id: id,
      FireStoreInstructorFieldsName.name: name,
    };
  }

  factory FieldModel.fromMap(Map<String, dynamic> map, String documentId) {
    return FieldModel(
      id: documentId,
      name: map[FireStoreInstructorFieldsName.name] as String,
    );
  }
}
