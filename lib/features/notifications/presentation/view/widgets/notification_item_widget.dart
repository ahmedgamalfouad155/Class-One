import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:sinna/features/notifications/data/models/notification_model.dart';
import 'package:sinna/features/notifications/presentation/manager/add_notification_cubit/add_notifications_cubit.dart';

class NotificationItemWidget extends StatelessWidget {
  const NotificationItemWidget({super.key, required this.notification});

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    final isAdmin = context.read<AuthCubit>().emailAdmin;
    return Dismissible(
      key: UniqueKey(),
      direction: isAdmin ? DismissDirection.endToStart : DismissDirection.none,
      onDismissed: (v) {
        context.read<AddNotificationsCubit>().deleteNotification(
          notification.id,
        );
      },
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(AppImages.done),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            notification.title,
                            style: AppStyles.textStyle14(
                              context,
                            ).copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "Sep 20, 2025",
                          style: AppStyles.textStyle16(
                            context,
                          ).copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Text(
                      notification.body,
                      style: AppStyles.textStyle14(
                        context,
                      ).copyWith(color: context.appColors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ), 
          CustomDividerWidget(),
        ],
      ),
    );
  }
}
