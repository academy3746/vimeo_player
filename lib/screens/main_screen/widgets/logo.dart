import 'package:flutter/material.dart';
import 'package:vimeo_player/common/constants/sizes.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    required this.onTap,
  });

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        'assets/images/splash.png',
        width: Sizes.size150,
        height: Sizes.size150,
      ),
    );
  }
}
