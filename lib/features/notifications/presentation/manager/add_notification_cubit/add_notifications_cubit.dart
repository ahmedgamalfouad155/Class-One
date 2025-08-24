import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/notifications/data/models/notification_model.dart';
import 'package:sinna/features/notifications/data/service/add_notifications_service.dart';
import 'package:sinna/features/notifications/presentation/manager/add_notification_cubit/add_notifications_state.dart'; 
import 'package:cloud_functions/cloud_functions.dart';

class AddNotificationsCubit extends Cubit<AddNotificationsState> {
  AddNotificationsCubit() : super(AddNotificationsInitial());

  final AddNotificationsService service = AddNotificationsServiceImpl();

  Future<void> addNotification(NotificationModel notificationModel) async {
    emit(AddingNotificationLoadingState());
    try {
      await service.addNotification(notificationModel);
      emit(AddingNotificationSuccessState());
    } catch (e) {
      emit(AddingNotificationFailureState(e.toString()));
    }
  }


Future<void> sendMessageToUsers(String title, String body) async {
  try {
    final HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('sendNotification');

    final result = await callable.call({
      'title': title,
      'body': body,
    });

    print("✅ تم إرسال الإشعار: ${result.data}");
  } catch (e) {
    print("❌ حصل خطأ: $e");
  }
}

}
