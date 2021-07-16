import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:weather/ui/screens/homepage/home.dart';
class SplashscreenView extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(
          backgroundColor: Colors.grey[100],
          splash:Image(image: AssetImage('assets/images/weather.png')),   
          splashTransition: SplashTransition.fadeTransition,
          nextScreen: Home(),
    );
  }
}
