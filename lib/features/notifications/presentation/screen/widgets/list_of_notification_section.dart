import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/notifications/presentation/manager/notifications_cubit/notifications_cubit.dart';
import 'package:sinna/features/notifications/presentation/manager/notifications_cubit/notifications_state.dart';
import 'package:sinna/features/notifications/presentation/screen/widgets/notification_item_widget.dart';

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

          /// 🔹 نعمل نسخة جديدة ونرتبها بالأحدث أولًا
          final sortedNotifications = [...notifications];
          sortedNotifications.sort(
            (a, b) => DateTime.parse(b.id).compareTo(DateTime.parse(a.id)),
          );

          return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => NotificationItemWidget(
              notification: sortedNotifications[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: sortedNotifications.length,
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
