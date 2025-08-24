import 'package:firebase_messaging/firebase_messaging.dart';
import 'local_notification_service.dart';

class PushNotificationService {
  static Future<void> initialize() async {
    // الاستماع للرسائل وقت ما الاب مفتوح
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        LocalNotificationService.showNotification(
          title: message.notification!.title ?? "No Title",
          body: message.notification!.body ?? "No Body",
        );
      }
    });

    // لو الاب في الخلفية واليوزر فتح الرسالة
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // هنا ممكن تعمل Navigation أو Action حسب الحاجة
    });
  }
}
