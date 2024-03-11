import 'package:flutter/material.dart';
import 'package:vimeo_player/common/constants/sizes.dart';

class CommonIconButton extends StatelessWidget {
  const CommonIconButton({
    super.key,
    required this.iconData,
    required this.onPressed,
  });

  final IconData iconData;

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(iconData),
      iconSize: Sizes.size44,
      color: Colors.white,
    );
  }
}
