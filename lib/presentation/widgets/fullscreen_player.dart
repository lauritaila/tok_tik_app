import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;

  const FullScreenPlayer(
      {super.key, required this.videoUrl, required this.caption});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
                child: CircularProgressIndicator(strokeWidth: 2));
          }
          return AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(children: [
              //Video
              VideoPlayer(controller),
              //gradient

              //caption
              Positioned(
                  bottom: 20,
                  right: 20,
                  child: _VideoCaption(caption: widget.caption))
            ]),
          );
        });
  }
}

class _VideoCaption extends StatelessWidget {
  const _VideoCaption({
    required this.caption,
  });

  final String caption;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final tileStyle = Theme.of(context).textTheme.titleLarge!;
    return SizedBox(
      width: size.width * 0.6,
      child: Text(
        caption,
        maxLines: 2,
        style: tileStyle,
      )
    );
  }
}
