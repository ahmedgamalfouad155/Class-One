import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/features/course_details/presentation/screens/widget/instractor_name_and_attachment_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';

class CourseVideoScreenBody extends StatefulWidget {
  final CourseModel course;

  const CourseVideoScreenBody({super.key, required this.course});

  @override
  State<CourseVideoScreenBody> createState() => _CourseVideoScreenBodyState();
}

class _CourseVideoScreenBodyState extends State<CourseVideoScreenBody> {
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

  void _exitFullScreen() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.red,
              onEnded: (metaData) {
                _exitFullScreen();
              },
            ),
            builder: (context, player) => player,
          ),
          CustomDividerWidget(isHeight: true),
          InstractorNameAndAttachmentWidget(
            instractorName: widget.course.tittle,
            attachmentUrl: widget.course.pdfUrl,
          ),
        ],
      ),
    );
  }
}
