import 'package:sinna/features/notifications/data/models/notification_model.dart';

sealed class NotificationsState {}

final class NotificationsInitial extends NotificationsState {}

final class NotificationsLoadingState extends NotificationsState {}

final class NotificationsSuccessState extends NotificationsState {
  final List<NotificationModel> notifications;
  NotificationsSuccessState(this.notifications);
}

final class NotificationsFailureState extends NotificationsState {
  final String errMessage;
  NotificationsFailureState(this.errMessage);
}
