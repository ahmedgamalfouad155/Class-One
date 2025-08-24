sealed class AddNotificationsState {}

final class AddNotificationsInitial extends AddNotificationsState {}

final class AddingNotificationLoadingState extends AddNotificationsState {}

final class AddingNotificationSuccessState extends AddNotificationsState {}

final class AddingNotificationFailureState extends AddNotificationsState {
  final String errMessage;
  AddingNotificationFailureState(this.errMessage);
}
