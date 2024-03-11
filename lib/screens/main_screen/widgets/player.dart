import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:vimeo_player/common/widgets/common_icon_button.dart';

class AppVideoPlayer extends StatefulWidget {
  const AppVideoPlayer({
    super.key,
    required this.file,
    required this.onNewVideoPressed,
  });

  final XFile file;

  final GestureTapCallback onNewVideoPressed;

  @override
  State<AppVideoPlayer> createState() => _AppVideoPlayerState();
}

class _AppVideoPlayerState extends State<AppVideoPlayer> {
  VideoPlayerController? videoController;

  bool showControl = false;

  @override
  void didUpdateWidget(covariant AppVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.file.path != widget.file.path) {
      _initializeController();
    }
  }

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

    controller.addListener(_videoControllerListener);

    setState(() {
      videoController = controller;
    });
  }

  void _onReversedPressed() {
    final currentPosition = videoController!.value.position;

    var position = const Duration();

    if (currentPosition.inSeconds > 3) {
      position = currentPosition - const Duration(seconds: 3);
    }

    videoController!.seekTo(position);
  }

  void _onPlayPressed() {
    if (videoController!.value.isPlaying) {
      videoController!.pause();
    } else {
      videoController!.play();
    }
  }

  void _onForwardPressed() {
    final maxPosition = videoController!.value.duration;

    final currentPosition = videoController!.value.position;

    var position = maxPosition;

    if ((maxPosition - const Duration(seconds: 3)).inSeconds >
        currentPosition.inSeconds) {
      position = currentPosition + const Duration(seconds: 3);
    }

    videoController!.seekTo(position);
  }

  void _videoControllerListener() {
    setState(() {});
  }

  @override
  void dispose() {
    videoController?.removeListener(_videoControllerListener);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (videoController == null) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          showControl = !showControl;
        });
      },
      child: AspectRatio(
        aspectRatio: videoController!.value.aspectRatio,
        child: Stack(
          children: [
            VideoPlayer(videoController!),
            if (showControl)
              Container(
                color: Colors.black.withOpacity(0.5),
              ),
            if (showControl)
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
            if (showControl)
              Align(
                alignment: Alignment.topRight,
                child: CommonIconButton(
                  iconData: Icons.photo_camera_back,
                  onPressed: widget.onNewVideoPressed,
                ),
              ),
            if (showControl)
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CommonIconButton(
                      iconData: Icons.rotate_left,
                      onPressed: _onReversedPressed,
                    ),
                    CommonIconButton(
                      iconData: videoController!.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      onPressed: _onPlayPressed,
                    ),
                    CommonIconButton(
                      iconData: Icons.rotate_right,
                      onPressed: _onForwardPressed,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
