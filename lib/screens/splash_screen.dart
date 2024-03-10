import 'package:flutter/material.dart';
import 'package:vimeo_player/common/constants/gaps.dart';
import 'package:vimeo_player/common/constants/sizes.dart';
import 'package:vimeo_player/screens/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () async {
      await Navigator.pushReplacementNamed(context, MainScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(
          Sizes.size20,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/splash.png',
                width: Sizes.size150,
                height: Sizes.size150,
              ),
              Gaps.v32,
              const Text(
                'VIMEO',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Sizes.size36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
