import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:initial_app/screens/initial_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Container(
        color: Colors.transparent,
        child: SvgPicture.asset(
          'assets/constants/logos/logo-splash-screen.svg',
        ),
      ),
      nextScreen: const InitialScreen(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: const Color(0xFF010116),
      animationDuration: const Duration(seconds: 5),
      splashIconSize: 300,
    );
  }
}
