import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

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
    final sliderMax = videoController!.value.duration.inSeconds.toDouble();

    final sliderValue = videoController!.value.position.inSeconds.toDouble();

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
                value: sliderValue,
                min: 0,
                max: sliderMax,
                onChanged: (value) {
                  videoController!.seekTo(
                    Duration(seconds: value.toInt()),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
  }
}
