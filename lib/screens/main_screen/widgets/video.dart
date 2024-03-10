import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vimeo_player/common/constants/gaps.dart';
import 'package:vimeo_player/screens/main_screen/widgets/app_name.dart';
import 'package:vimeo_player/screens/main_screen/widgets/logo.dart';

class VideoClass {
  final BuildContext context;

  final XFile? file;

  Logo logo = const Logo();

  AppName appName = const AppName();

  VideoClass({
    required this.context,
    this.file,
  });

  Widget renderEmpty() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
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
    return Container();
  }
}
