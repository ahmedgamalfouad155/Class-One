import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/helper/course_video_helper.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart'; 
import 'package:sinna/features/course_details/presentation/manager/lesson_manager/lesson_manager_cubit.dart';
import 'package:sinna/features/course_details/presentation/widget/course_video_app_bar_widget.dart';
import 'package:sinna/features/course_details/presentation/widget/list_of_attachment_widget.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart'; 

class CourseVideoScreenBody extends StatefulWidget { 
  final CoursePathModel? coursePathModel;
  final String? lessonId;
  const CourseVideoScreenBody({
    super.key, 
    this.coursePathModel,
    this.lessonId,
  });

  @override
  State<CourseVideoScreenBody> createState() => _CourseVideoScreenBodyState();
}

class _CourseVideoScreenBodyState extends State<CourseVideoScreenBody> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();

    final cubit = context.read<LessonManagerCubit>();
    cubit.getLesson(widget.lessonId!, widget.coursePathModel!); 
    controller = YoutubePlayerController(
      initialVideoId: '',
      flags: const YoutubePlayerFlags(autoPlay: false),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonManagerCubit, LessonManagerState>(
      builder: (context, state) {
        if (state is GetingLessonLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetingLessonSuccessState) {
          final course = state.lesson;
          final videoId = YoutubePlayer.convertUrlToId(course.videoUrl);
          if (videoId != null && controller.initialVideoId != videoId) {
            controller = YoutubePlayerController(
              initialVideoId: videoId,
              flags: const YoutubePlayerFlags(
                autoPlay: false,
                mute: false,
                enableCaption: true,
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CourseVideoAppBarWidget(
                        course: course,
                        coursePathModel: widget.coursePathModel,
                      ),
                      Text(
                        course.tittle,
                        style: AppStyles.textStyle22W600(context),
                      ),
                    ],
                  ),
                ),
                YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    controller: controller,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: context.appColors.red,
                    onEnded: (metaData) {
                      exitFullScreen();
                    },
                  ),
                  builder: (context, player) => player,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListOfAttachmentWidtget(
                    attachmentModel: course.attachments,
                  ),
                ),
              ],
            ),
          );
        } else if (state is GetingLessonFailureState) {
          return Text(state.errMessage);
        } else {
          return const Text("error");
        }
      },
    );
  }
}

