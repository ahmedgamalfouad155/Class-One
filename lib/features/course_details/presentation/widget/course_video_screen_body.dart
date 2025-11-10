import 'package:flutter/material.dart'; 
import 'package:sinna/core/helper/course_video_helper.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/features/course_details/presentation/widget/course_video_app_bar_widget.dart';
import 'package:sinna/features/course_details/presentation/widget/list_of_attachment_widget.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';

class CourseVideoScreenBody extends StatefulWidget {
  final CourseModel course;
  final CoursePathModel? coursePathModel;
  const CourseVideoScreenBody({
    super.key,
    required this.course,
    this.coursePathModel,
  });

  @override
  State<CourseVideoScreenBody> createState() => _CourseVideoScreenBodyState();
} 
class _CourseVideoScreenBodyState extends State<CourseVideoScreenBody> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    initPlayer();
  } 
  void initPlayer() {
    final videoId = YoutubePlayer.convertUrlToId(widget.course.videoUrl);
    if (videoId != null) {
      controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          enableCaption: true,
        ),
      );
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  } 

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CourseVideoAppBarWidget(
                  course: widget.course,
                  coursePathModel: widget.coursePathModel,
                ),
                Text(
                  widget.course.tittle,
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
            child: Column(
              children: [
                CustomDividerWidget(isHeight: true),
                ListOfAttachmentWidtget(
                  pdfTitle: "widget.course.pdfTitle",
                  pdfUrl: "widget.course.pdfUrl",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
