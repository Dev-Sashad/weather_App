import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:weather/ui/screens/homepage/home.dart';
class SplashscreenView extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(
          backgroundColor: Colors.grey[100],
          splash:Column( 
                      children: [
                        Container(
                          height: 50,
                          width: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/weather.png'),
                              fit: BoxFit.fill
                              )
                          ), ),
                          // SizedBox(height: 10),
                        Text('Weather App', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.blue),)
                      ],
          ),   
          splashTransition: SplashTransition.fadeTransition,
          nextScreen: Home(),
    );
  }
}
