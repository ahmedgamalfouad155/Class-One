class CoursePathModel {
  String? country;
  String? university;
  String? faculty;
  String? program;
  String? stage;
  String? subject;
  String? term;
  String? id;
  bool? isPaid;
  String? subjectName;
  String? subjectDoctor;
  String? subjectImage;

  CoursePathModel({
    this.country,
    this.university,
    this.faculty,
    this.program,
    this.stage,
    this.subject,
    this.term,
    this.id,
    this.isPaid,
    this.subjectName,
    this.subjectDoctor,
    this.subjectImage,
  });

  void update({
    String? country,
    String? university,
    String? faculty,
    String? program,
    String? stage,
    String? subject,
    String? term,
    String? id,
    bool? isPaid,
    String? subjectName,
    String? subjectDoctor,
    String? subjectImage,
  }) {
    if (country != null) this.country = country;
    if (university != null) this.university = university;
    if (faculty != null) this.faculty = faculty;
    if (program != null) this.program = program;
    if (stage != null) this.stage = stage;
    if (subject != null) this.subject = subject;
    if (term != null) this.term = term;
    if (id != null) this.id = id;
    if (isPaid != null) this.isPaid = isPaid;
    if (subjectName != null) this.subjectName = subjectName;
    if (subjectDoctor != null) this.subjectDoctor = subjectDoctor;
    if (subjectImage != null) this.subjectImage = subjectImage;
  }

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'university': university,
      'faculty': faculty,
      'program': program,
      'stage': stage,
      'subject': subject,
      'term': term,
      'id': id,
      'isPaid': isPaid ?? false,
      'subjectName': subjectName,
      'subjectDoctor': subjectDoctor,
      'subjectImage': subjectImage,
    };
  }

  factory CoursePathModel.fromMap(Map<String, dynamic> map, String documentId) {
    return CoursePathModel(
      country: map['country'],
      university: map['university'],
      faculty: map['faculty'],
      program: map['program'],
      stage: map['stage'],
      subject: map['subject'],
      term: map['term'],
      id: documentId,
      isPaid: map['isPaid'] ?? true,
      subjectName: map['subjectName'],
      subjectDoctor: map['subjectDoctor'],
      subjectImage: map['subjectImage'],
    );
  }
}
