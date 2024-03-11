import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:vimeo_player/common/widgets/common_icon_button.dart';

class AppVideoPlayer extends StatefulWidget {
  const AppVideoPlayer({
    super.key,
    required this.file,
  });

  final XFile file;

  @override
  State<AppVideoPlayer> createState() => _AppVideoPlayerState();
}

class _AppVideoPlayerState extends State<AppVideoPlayer> {
  VideoPlayerController? videoController;

  @override
  void initState() {
    super.initState();

    _initializeController();
  }

  Future<void> _initializeController() async {
    final controller = VideoPlayerController.file(
      File(widget.file.path),
    );

    await controller.initialize();

    setState(() {
      videoController = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (videoController == null) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    } else {
      return AspectRatio(
        aspectRatio: videoController!.value.aspectRatio,
        child: Stack(
          children: [
            VideoPlayer(videoController!),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Slider(
                value: videoController!.value.position.inSeconds.toDouble(),
                min: 0,
                max: videoController!.value.duration.inSeconds.toDouble(),
                onChanged: (double value) {
                  videoController!.seekTo(
                    Duration(seconds: value.toInt()),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: CommonIconButton(
                iconData: Icons.photo_camera_back,
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CommonIconButton(
                    iconData: Icons.rotate_left,
                    onPressed: () {},
                  ),
                  CommonIconButton(
                    iconData: videoController!.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    onPressed: () {},
                  ),
                  CommonIconButton(
                    iconData: Icons.rotate_right,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
