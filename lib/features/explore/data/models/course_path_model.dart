class CoursePathModel {
  String? university;
  String? specialization;
  String? program;
  String? level;
  String? subject;
  String? term;
  String? id;
  bool? isPaid;
  String? title;
  String? instructor;
  String? image;

  CoursePathModel({
    this.university,
    this.specialization,
    this.program,
    this.level,
    this.subject,
    this.term,
    this.id,
    this.isPaid,
    this.title,
    this.instructor,
    this.image,
  });

  void update({
    String? country,
    String? specialization,
    String? university,
    String? faculty,
    String? program,
    String? level,
    String? subject,
    String? term,
    String? id,
    bool? isPaid,
    String? title,
    String? instructor,
    String? image,
  }) {
    if (university != null) this.university = university;
    if (specialization != null) this.specialization = specialization;
    if (program != null) this.program = program;
    if (level != null) this.level = level;
    if (subject != null) this.subject = subject;
    if (term != null) this.term = term;
    if (id != null) this.id = id;
    if (isPaid != null) this.isPaid = isPaid;
    if (title != null) this.title = title;
    if (instructor != null) this.instructor = instructor;
    if (image != null) this.image = image;
  }

  Map<String, dynamic> toMap() {
    return {
      'university': university,
      "specialization": specialization,
      'program': program,
      'level': level,
      'subject': subject,
      'term': term,
      'id': id,
      'isPaid': isPaid ?? true,
      'subjectName': title,
      'subjectDoctor': instructor,
      'subjectImage': image,
    };
  }

  factory CoursePathModel.fromMap(Map<String, dynamic> map, String documentId) {
    return CoursePathModel(
      university: map['university'],
      specialization: map["specialization"],
      program: map['program'],
      level: map['level'],
      subject: map['subject'],
      term: map['term'],
      id: documentId,
      isPaid: map['isPaid'] ?? true,
      title: map['subjectName'],
      instructor: map['subjectDoctor'],
      image: map['subjectImage'],
    );
  }
}
