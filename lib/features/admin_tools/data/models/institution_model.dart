import 'package:sinna/core/constants/constants.dart';

class InstitutionModel {
   String id;
   String name;

  InstitutionModel({required this.id, required this.name});

  void update({String? id, String? name}) {
    if (id != null) this.id = id;
    if (name != null) this.name = name;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      FireStoreInstitutionFieldsName.id: id,
      FireStoreInstitutionFieldsName.name: name,
    };
  }

  factory InstitutionModel.fromMap(
    Map<String, dynamic> map,
    String documentId,
  ) {
    return InstitutionModel(
      id: documentId,
      name: map[FireStoreInstitutionFieldsName.name] as String,
    );
  }
}
