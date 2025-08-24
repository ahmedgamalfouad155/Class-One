import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';
import 'package:sinna/features/notifications/data/models/notification_model.dart';

abstract class NotificationsService {
  Stream<List<NotificationModel>> getNotifications();
}

class NotificationsServiceImpl extends NotificationsService {
  final firestor = FirestoreServices.instance;
  @override
  Stream<List<NotificationModel>> getNotifications() {
    return firestor.collectionsStram(
      path: FirestorePath.myNotifications(),
      builder: (data, documentId) {
        // print(data);
        return NotificationModel.fromMap(data!, documentId);
      },
    );
  }
}
