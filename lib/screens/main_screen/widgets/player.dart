import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AppVideoPlayer extends StatefulWidget {
  const AppVideoPlayer({
    super.key,
    this.file,
  });

  final XFile? file;

  @override
  State<AppVideoPlayer> createState() => _AppVideoPlayerState();
}

class _AppVideoPlayerState extends State<AppVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Sample Video Player',
      style: TextStyle(color: Colors.white),
    );
  }
}
