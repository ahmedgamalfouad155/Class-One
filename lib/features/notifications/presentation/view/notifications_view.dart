import 'package:flutter/material.dart';
import 'package:sinna/features/notifications/presentation/view/widgets/notifications_view_body.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: NotificationsViewBody(),
    );
  }
}
