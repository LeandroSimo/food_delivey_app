import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/modules/welcome/views/welcome_screen.dart';
import 'package:food_delivery_app/utils/constants.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then(
      (_) => Navigator.popAndPushNamed(context, WelcomeScreen.route),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/food_pattern.png',
            repeat: ImageRepeat.repeatY,
            color: orange,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/lottie/splash.json'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
