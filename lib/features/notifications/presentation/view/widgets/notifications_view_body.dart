import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:sinna/features/notifications/presentation/view/widgets/adding_notifications_section.dart';
import 'package:sinna/features/notifications/presentation/view/widgets/list_of_notification_section.dart';

class NotificationsViewBody extends StatelessWidget {
  const NotificationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isAdmin = context.read<AuthCubit>().emailAdmin;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            isAdmin ? AddingNotificationSections() : SizedBox(),
            const SizedBox(height: 20),
            ListOfNotificationsSection(),
          ],
        ),
      ),
    );
  }
}
