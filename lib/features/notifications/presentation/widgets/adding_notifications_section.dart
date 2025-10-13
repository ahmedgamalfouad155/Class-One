import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:sinna/core/constants/constants.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/widgets/custom_animated_dialod.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/features/notifications/data/models/notification_model.dart';
import 'package:sinna/features/notifications/presentation/manager/add_notification_cubit/add_notifications_cubit.dart';
import 'package:sinna/features/notifications/presentation/manager/add_notification_cubit/add_notifications_state.dart';

class AddingNotificationSections extends StatelessWidget {
  const AddingNotificationSections({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController bodyController = TextEditingController();
    final notificationCubit = context.read<AddNotificationsCubit>();
    return Column(
      children: [
        CustomTextFieldWidget(
          hintText: "Add notification title",
          controller: titleController,
        ),
        const SizedBox(height: 10),
        CustomTextFieldWidget(
          hintText: "Add notification body",
          controller: bodyController,
        ),
        const SizedBox(height: 10),
        BlocConsumer<AddNotificationsCubit, AddNotificationsState>(
          listener: (context, state) {
            if (state is AddingNotificationSuccessState) {
              titleController.clear();
              bodyController.clear();
              CustomAnimatedDialog.show(
                context: context,
                message: "Notification added successfully ✅🎉",
                icon: Lottie.asset(AppAinmation.done, width: 100),
              );
            }
          },
          builder: (context, state) {
            if (state is AddingNotificationLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AddingNotificationSuccessState ||
                state is AddNotificationsInitial) {
              return CustomButton(
                text: 'Add Notification',
                onPressed: () async { 
                  notificationCubit.addNotification(
                    NotificationModel(
                      id: documentIdFromLocalData(),
                      title: titleController.text,
                      body: bodyController.text,
                    ),
                  );
                
                },
              );
            } else if (state is AddingNotificationFailureState) {
              return Text(state.errMessage);
            } else {
              return const Text('error');
            }
          },
        ),
      ],
    );
  }
}