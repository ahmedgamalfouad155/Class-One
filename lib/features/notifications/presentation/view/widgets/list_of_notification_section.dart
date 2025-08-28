import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/notifications/presentation/manager/add_notification_cubit/add_notifications_cubit.dart';
import 'package:sinna/features/notifications/presentation/manager/notifications_cubit/notifications_cubit.dart';
import 'package:sinna/features/notifications/presentation/manager/notifications_cubit/notifications_state.dart';

class ListOfNotificationsSection extends StatelessWidget {
  const ListOfNotificationsSection({super.key, required this.isAdmin});
  final bool isAdmin;

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
            itemBuilder: (context, index) => Card(
              elevation: 5,
              color: context.appColors.white,
              child: ListTile(
                leading: Image.asset(AppImages.logo, width: 60),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        sortedNotifications[index].title,
                        style: AppStyles.textStyle16(context),
                      ),
                    ),
                    isAdmin
                        ? InkWell(
                            onTap: () {
                              context
                                  .read<AddNotificationsCubit>()
                                  .deleteNotification(
                                    sortedNotifications[index].id,
                                  );
                            },
                            child: const Icon(Icons.delete, color: Colors.red),
                          )
                        : SizedBox(),
                  ],
                ),
                subtitle: Text(
                  sortedNotifications[index].body,
                  style: AppStyles.textStyle14(
                    context,
                  ).copyWith(color: context.appColors.grey),
                ),
              ),
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
