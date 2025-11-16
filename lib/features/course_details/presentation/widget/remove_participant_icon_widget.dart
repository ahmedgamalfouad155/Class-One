import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/features/auth/data/models/user_info_model.dart';
import 'package:sinna/features/course_details/presentation/manager/course_participants_cubit/course_participants_cubit.dart';
import 'package:sinna/features/course_details/presentation/manager/course_participants_cubit/course_participants_state.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';

class RemoveParticipantIconWidget extends StatelessWidget {
  const RemoveParticipantIconWidget({
    super.key,
    required this.participant,
    required this.coursePathModel,
  });

  final UserInfoModel participant;
  final CoursePathModel coursePathModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseParticipantsCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<CourseParticipantsCubit, CourseParticipantsState>(
            builder: (context, state) {
              if (state is RemovingParticipantFromCourseLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is RemovingParticipantFromCourseSuccessState ||
                  state is CourseParticipantsInitial) {
                return CustomSlidableAction(
                  onPressed: (_) { 
                    context
                        .read<CourseParticipantsCubit>()
                        .removeParticipantFromCourse(
                          participant.email!,
                          coursePathModel,
                        );
                  },
                  backgroundColor: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.appColors.red,
                      shape: BoxShape.circle,
                    ),
                    width: 30.w,
                    height: 30.h,
                    child: Icon(
                      Icons.remove,
                      color: context.appColors.white,
                      size: 22,
                    ),
                  ),
                );
              }
              if (state is RemovingParticipantFromCourseFailureState) {
                return Text(state.errMessage);
              } else {
                return const Text("error");
              }
            },
          );
        },
      ),
    );
  }
}
