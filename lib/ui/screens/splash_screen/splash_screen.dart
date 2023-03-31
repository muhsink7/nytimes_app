import 'package:flutter/material.dart';
import 'package:nytimes_cloudium/constants/app_images.dart';
import 'package:nytimes_cloudium/ui/screens/home_screen/home_screen.dart';
import 'package:nytimes_cloudium/ui/widgets/animated_splash.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'splash_screen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset(Images.logo),
      nextScreen: const HomeScreen(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.rightToLeftWithFade,
      backgroundColor: Colors.white,
      animationDuration: const Duration(milliseconds: 1600),
      duration: 2000,
    );
  }
}
