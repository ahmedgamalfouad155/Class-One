import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/categories/data/models/course_model.dart';

class CourseVideoViewBody extends StatefulWidget {
  final CourseModel course;

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
    final videoUrl = widget.course.videoUrl;
    if (videoUrl.isNotEmpty) {
      final videoId = YoutubePlayer.convertUrlToId(videoUrl);
      if (videoId != null) {
        _controller = YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
            mute: false,
            enableCaption: true,
          ),
        )..addListener(_onPlayerChange);
      }
    }
  }

  void _onPlayerChange() {
    if (_controller != null && _controller!.value.isFullScreen) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => FullScreenVideo(controller: _controller!),
        ),
      ).then((_) {
        _controller!.toggleFullScreenMode();
      });
    }
  }

  @override
  dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override 
    Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_controller != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: YoutubePlayer(
                controller: _controller!,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.red,
              ),
            )
          else
            Center(
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
          const SizedBox(height: 20),
          Text(widget.course.name, style: AppStyles.textStyle18(context)),
        ],
      ),
    );
  }
}

class FullScreenVideo extends StatelessWidget {
  final YoutubePlayerController controller;

  const FullScreenVideo({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        top: false,
        bottom: false,
        child: Center(
          child: YoutubePlayer(
            controller: controller,
            showVideoProgressIndicator: true,
          ),
        ),
      ),
    );
  }
}
