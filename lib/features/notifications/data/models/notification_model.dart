class NotificationModel {
  final String title;
  final String body;
  final String id;

  NotificationModel({
    required this.title,
    required this.body,
    required this.id,
  }); 

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'body': body,
      'id': id,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map, String documentId) {
    return NotificationModel(
      title: map['title'] as String,
      body: map['body'] as String,
      id: documentId,
    );
  }
}
