class CoursePathModel {
  String? id;
  String? country;
  String? university;
  String? system;
  String? level;
  String? subject;
  String? term;
  String? doctor;
  bool? isPaid;

  CoursePathModel({
    this.id,
    this.country,
    this.university,
    this.system,
    this.level,
    this.subject,
    this.term,
    this.doctor,
    this.isPaid ,
  });

  void update({
    String? id,
    String? country,
    String? university,
    String? system,
    String? level,
    String? subject,
    String? term,
    String? doctor,
  }) {
    if (id != null) this.id = id;
    if (country != null) this.country = country;
    if (university != null) this.university = university;
    if (system != null) this.system = system;
    if (level != null) this.level = level;
    if (subject != null) this.subject = subject;
    if (term != null) this.term = term;
    if (doctor != null) this.doctor = doctor;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'country': country,
      'university': university,
      'system': system,
      'level': level,
      'subject': subject,
      'term': term,
      'doctor': doctor,
      'isPaid': isPaid ?? false,
    };
  }

  factory CoursePathModel.fromMap(Map<String, dynamic> map, String documentId) {
    return CoursePathModel(
      id: documentId,
      country: map['country'],
      university: map['university'],
      system: map['system'],
      level: map['level'],
      subject: map['subject'],
      term: map['term'],
      doctor: map['doctor'],
      isPaid: map['isPaid'] ?? false,
    );
  }
}
