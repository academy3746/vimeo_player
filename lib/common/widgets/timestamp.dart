import 'package:flutter/material.dart';

class TimeStamp {
  Widget timestampToString(Duration duration) {
    var videoTime =
        '${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';

    return Text(
      videoTime,
      style: const TextStyle(color: Colors.white),
    );
  }
}
