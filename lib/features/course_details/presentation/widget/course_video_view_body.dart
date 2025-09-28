import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/course_details/presentation/screens/pdf_viewer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';

class CourseVideoViewBody extends StatefulWidget {
  final CourseModel course;

  const CourseVideoViewBody({super.key, required this.course});

  @override
  State<CourseVideoViewBody> createState() => _CourseVideoViewBodyState();
}

class _CourseVideoViewBodyState extends State<CourseVideoViewBody> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  void _initPlayer() {
    final videoId = YoutubePlayer.convertUrlToId(widget.course.videoUrl);
    if (videoId != null) {
      _controller = YoutubePlayerController(
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
    _controller.dispose();
    super.dispose();
  }

  void _enterFullScreen() {
    // Force landscape
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    _controller.toggleFullScreenMode();
  }

  void _exitFullScreen() {
    // Back to portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.red,
        onEnded: (metaData) {
          _exitFullScreen();
        },
      ),
      builder: (context, player) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Stack(
                  children: [
                    player,
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(Icons.fullscreen, color: Colors.white),
                        onPressed: _enterFullScreen,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.course.tittle,
                style: AppStyles.textStyle18Bold(context),
              ),
              const SizedBox(height: 20),

              CustomButton(
                text: "PDF",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PdfViewerPage(pdfUrl: widget.course.pdfUrl),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
