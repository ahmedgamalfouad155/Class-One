import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/notifications/data/service/notifications_service.dart';
import 'package:sinna/features/notifications/presentation/manager/notifications_cubit/notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial());
  final NotificationsService service = NotificationsServiceImpl();
  StreamSubscription? _cartSubscription;

  void getNotifications() {
    emit(NotificationsLoadingState());
    _cartSubscription = service.getNotifications().listen(
      (notifications) {
        emit(NotificationsSuccessState(notifications)); 
      },
      onError: (e) {
        emit(NotificationsFailureState(e.toString()));
      },
    );
  }

  @override
  Future<void> close() {
    _cartSubscription?.cancel();
    return super.close();
  }
}
