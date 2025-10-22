class InstitutionModel {
  final String id;
  final String name;

  InstitutionModel({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'name': name};
  }

  factory InstitutionModel.fromMap(Map<String, dynamic> map, String documentId) {
    return InstitutionModel(id: documentId, name: map['name'] as String);
  }
}
