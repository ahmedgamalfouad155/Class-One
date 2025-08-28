import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/notifications/presentation/manager/add_notification_cubit/add_notifications_cubit.dart';
import 'package:sinna/features/notifications/presentation/manager/notifications_cubit/notifications_cubit.dart';
import 'package:sinna/features/notifications/presentation/view/widgets/notifications_view_body.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AddNotificationsCubit()),
          BlocProvider(create: (context) => NotificationsCubit()..getNotifications()),
        ],
        child: NotificationsViewBody()),
    );
  }
}
