import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vimeo_player/common/constants/gaps.dart';
import 'package:vimeo_player/screens/main_screen/widgets/app_name.dart';
import 'package:vimeo_player/screens/main_screen/widgets/logo.dart';
import 'package:vimeo_player/screens/main_screen/widgets/player.dart';

class VideoClass {
  final BuildContext context;

  final XFile? file;

  final Function() onNewVideoPressed;

  VideoClass({
    required this.context,
    this.file,
    required this.onNewVideoPressed,
  });

  Widget renderEmpty() {
    var logo = Logo(onTap: onNewVideoPressed);

    var appName = const AppName();

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF2A3A7C),
            Color(0xFF000118),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logo,
          Gaps.v32,
          appName,
        ],
      ),
    );
  }

  Widget renderVideo() {
    return Center(
      child: AppVideoPlayer(
        file: file!,
        onNewVideoPressed: onNewVideoPressed,
      ),
    );
  }
}
