// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vimeo_player/common/widgets/back_handler_button.dart';
import 'package:vimeo_player/screens/main_screen/widgets/video_class.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const String routeName = '/main';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  BackHandlerButton? backHandlerButton;

  XFile? video;

  late VideoClass vc;

  @override
  void initState() {
    super.initState();

    backHandlerButton = BackHandlerButton(context: context);
  }

  Future<void> _onNewVideoPressed() async {
    final videoFile = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );

    if (videoFile != null) {
      setState(() {
        video = videoFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    vc = VideoClass(
        context: context,
        file: video,
        onNewVideoPressed: _onNewVideoPressed
    );

    return WillPopScope(
      onWillPop: () async {
        if (backHandlerButton != null) {
          return backHandlerButton!.onWillPop();
        }

        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: video == null ? vc.renderEmpty() : vc.renderVideo(),
      ),
    );
  }
}
