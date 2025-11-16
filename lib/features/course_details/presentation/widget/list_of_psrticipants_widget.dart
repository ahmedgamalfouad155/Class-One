import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_empty_screen.dart';
import 'package:sinna/core/widgets/custom_user_info_widget.dart';
import 'package:sinna/features/course_details/presentation/manager/course_participants_cubit/course_participants_cubit.dart';
import 'package:sinna/features/course_details/presentation/manager/course_participants_cubit/course_participants_state.dart';
import 'package:sinna/features/course_details/presentation/widget/remove_participant_icon_widget.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/profile/presentation/manager/theme_cubit/theme_cubit.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class ListOfParticipantsWidget extends StatelessWidget {
  const ListOfParticipantsWidget({super.key, required this.coursePathModel});
  final CoursePathModel coursePathModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseParticipantsCubit, CourseParticipantsState>(
      builder: (context, state) {
        if (state is GetingPaticipantsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetingPaticipantsSuccessState) { 
          if (state.participants.isEmpty) {
            return Column(
              children: [
                SizedBox(height: context.height / 5),
                CustomEmptyScreen(
                  image: context.read<ThemeCubit>().isDark
                      ? AppImages.emptyParticipantsDark
                      : AppImages.emptyParticipantsLight,
                  title: "",
                  subTitle: LocaleKeys.this_course_doesnt_have_any_enrolled_users.tr(), 
                ),
              ],
            );
          }
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.participants.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final participant = state.participants[index];
              return Slidable(
                key: ValueKey(participant.email),
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  extentRatio: 0.20,
                  children: [
                    RemoveParticipantIconWidget(
                      participant: participant,
                      coursePathModel: coursePathModel,
                    ),
                  ],
                ),
                child: CustomUserInfoWidget(
                  name: participant.name ?? '',
                  email: participant.email ?? '',
                ),
              );
            },
          );
        } else if (state is GetingPaticipantsFailureState) {
          return Text(state.errMessage);
        } else {
          return const Text("error");
        }
      },
    );
  }
}
