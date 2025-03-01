import 'package:flutter/material.dart';
import 'package:tok_tik_app/domain/entities/video_post.dart';
import 'package:tok_tik_app/presentation/widgets/video/fullscreen_player.dart';
import 'package:tok_tik_app/presentation/widgets/shared/video_buttons.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (_, index) { 
        final VideoPost videoPost = videos[index];
        return Stack(
          children:[
            //Video Player + gradient
            SizedBox.expand(
              child: FullScreenPlayer(caption: videoPost.caption, videoUrl: videoPost.videoUrl)
            ),
            //Buttons
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost))
          ]
        );

      }
    );
  }
}

