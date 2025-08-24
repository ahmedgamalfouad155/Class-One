import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/features/notifications/presentation/manager/notifications_cubit/notifications_cubit.dart';
import 'package:sinna/features/notifications/presentation/manager/notifications_cubit/notifications_state.dart';

class ListOfNotificationsSection extends StatelessWidget {
  const ListOfNotificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        if (state is NotificationsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is NotificationsSuccessState) {
          final notifications = state.notifications;
          return ListView.separated(
            itemBuilder: (context, index) => Card(
              elevation: 10,
              color: context.appColors.white,
              child: ListTile(
                leading: Image.asset(AppImages.logo),
                title: Text(notifications[index].title),
                subtitle: Text(notifications[index].body),
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: notifications.length,
          );
        } else if (state is NotificationsFailureState) {
          return Text(state.errMessage);
        } else {
          return const Text("error");
        }
      },
    );
  }
}
