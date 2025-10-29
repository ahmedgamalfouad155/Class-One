import 'package:sinna/core/constants/constants.dart';

class InstructorModel {
  final String id;
  final String name;

  InstructorModel({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      FireStoreInstructorFieldsName.id: id,
      FireStoreInstructorFieldsName.name: name,
    };
  }

  factory InstructorModel.fromMap(Map<String, dynamic> map, String documentId) {
    return InstructorModel(
      id: documentId,
      name: map[FireStoreInstructorFieldsName.name] as String,
    );
  }
}
