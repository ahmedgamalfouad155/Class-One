import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';
import 'package:sinna/features/notifications/data/models/notification_model.dart';

abstract class AddNotificationsService {
  Future<void> addNotification(NotificationModel notificationModel);
}

class AddNotificationsServiceImpl extends AddNotificationsService {
  final firestor = FirestoreServices.instance;  

  @override
  Future<void> addNotification(NotificationModel notificationModel) async {
    await firestor.setData(
      path: FirestorePath.notifications(notificationModel.id),
      data: notificationModel.toMap(),
    );
  }
}
