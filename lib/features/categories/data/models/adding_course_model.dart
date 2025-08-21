// class AddingCourseModel {
//   String? id;
//   String? country;
//   String? university;
//   String? faculty;
//   String? program;
//   String? stage;
//   String? subject;
//   String? term;
//   bool? isPaid;
//   String? subjectName;
//   String? subjectDoctor;
//   String? subjectImage;

//   AddingCourseModel({
//     this.id,
//     this.country,
//     this.university,
//     this.faculty,
//     this.program,
//     this.stage,
//     this.subject,
//     this.term,
//     this.isPaid,
//     this.subjectName,
//     this.subjectDoctor,
//     this.subjectImage,
//   });

//   void update({
//     String? id,
//     String? country,
//     String? university,
//     String? faculty,
//     String? program,
//     String? stage,
//     String? subject,
//     String? term,
//     bool? isPaid,
//     String? subjectName,
//     String? subjectDoctor,
//     String? subjectImage,
//   }) {
//     if (id != null) this.id = id;
//     if (country != null) this.country = country;
//     if (university != null) this.university = university;
//     if (faculty != null) this.faculty = faculty;
//     if (program != null) this.program = program;
//     if (stage != null) this.stage = stage;
//     if (subject != null) this.subject = subject;
//     if (term != null) this.term = term;
//     if (isPaid != null) this.isPaid = isPaid;
//     if (subjectName != null) this.subjectName = subjectName;
//     if (subjectDoctor != null) this.subjectDoctor = subjectDoctor;
//     if (subjectImage != null) this.subjectImage = subjectImage;
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'country': country,
//       'university': university,
//       'faculty': faculty,
//       'program': program,
//       'stage': stage,
//       'subject': subject,
//       'term': term,
//       'isPaid': isPaid ?? false,
//       'subjectName': subjectName,
//       'subjectDoctor': subjectDoctor,
//       'subjectImage': subjectImage,
//     };
//   }

//   factory AddingCourseModel.fromMap(
//     Map<String, dynamic> map,
//     String documentId,
//   ) {
//     return AddingCourseModel(
//       id: documentId,
//       country: map['country'],
//       university: map['university'],
//       program: map['system'],
//       stage: map['level'],
//       subject: map['subject'],
//       term: map['term'],
//       isPaid: map['isPaid'] ?? false,
//       subjectName: map['subjectName'],
//       subjectDoctor: map['subjectDoctor'],
//       subjectImage: map['subjectImage'],
//     );
//   }
// }
