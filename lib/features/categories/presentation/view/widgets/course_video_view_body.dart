import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/features/categories/data/models/leson_model.dart';

class CourseVideoViewBody extends StatefulWidget {
  final CourseModel course; // الموديل اللي جاي من الداتا
  const CourseVideoViewBody({super.key, required this.course});

  @override
  State<CourseVideoViewBody> createState() => _CourseVideoViewBodyState();
}

class _CourseVideoViewBodyState extends State<CourseVideoViewBody> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  void _initPlayer() {
    // الفيديو URL بيجي من الموديل
    final videoUrl = widget.course.videoUrl;
    if (videoUrl.isNotEmpty) {
      final videoId = YoutubePlayer.convertUrlToId(videoUrl);
      if (videoId != null) {
        _controller = YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: AppMedia.width(context),
            height: AppMedia.height(context) / 3,
            decoration: CustomsBoxDecoration().defaultBoxDecoration(context),
            child: _controller != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: YoutubePlayer(
                      controller: _controller!,
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.red,
                    ),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.play_circle_outline, size: 48),
                        const SizedBox(height: 8),
                        Text(
                          'لا يوجد فيديو متاح',
                          style: AppStyles.textStyle16(context),
                        ),
                      ],
                    ),
                  ),
          ),
          const SizedBox(height: 20),
          Text(widget.course.name, style: AppStyles.textStyle18(context)),
        ],
      ),
    );
  }
}
