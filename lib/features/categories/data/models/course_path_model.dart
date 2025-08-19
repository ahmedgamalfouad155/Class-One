class CoursePathModel {
  String? id;
  String? country;
  String? university;
  String? faculty;
  String? program;
  String? stage;
  String? subject;
  String? term;
  String? doctor;
  bool? isPaid;

  CoursePathModel({
    this.id,
    this.country,
    this.university,
      this.faculty,
    this.program,
    this.stage,
    this.subject,
    this.term,
    this.doctor,
    this.isPaid,
  });

  void update({
    String? id,
    String? country,
    String? university,
    String? faculty,
    String? program,
    String? stage,
    String? subject,
    String? term,
  }) {
    if (id != null) this.id = id;
    if (country != null) this.country = country;
    if (university != null) this.university = university;
    if (faculty != null) this.faculty = faculty;
    if (program != null) this.program = program;
    if (stage != null) this.stage = stage;
    if (subject != null) this.subject = subject;
    if (term != null) this.term = term;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'country': country,
      'university': university,
      'faculty': faculty,
      'program': program,
      'stage': stage,
      'subject': subject,
      'term': term,
      'isPaid': isPaid ?? false,
    };
  }

  factory CoursePathModel.fromMap(Map<String, dynamic> map, String documentId) {
    return CoursePathModel(
      id: documentId,
      country: map['country'],
      university: map['university'],
      program: map['system'],
      stage: map['level'],
      subject: map['subject'],
      term: map['term'],
      isPaid: map['isPaid'] ?? false,
    );
  }
}
