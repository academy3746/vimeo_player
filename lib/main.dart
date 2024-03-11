import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vimeo_player/screens/main_screen/main_screen.dart';
import 'package:vimeo_player/screens/splash_screen/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

  runApp(const VideoApp());
}

class VideoApp extends StatelessWidget {
  const VideoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vimeo Player',
      theme: ThemeData(
        primaryColor: const Color(0xFF2A3A7C),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF2A3A7C),
          ),
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        MainScreen.routeName: (context) => const MainScreen(),
      },
    );
  }
}
