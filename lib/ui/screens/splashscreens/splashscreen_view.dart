import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:weather/ui/screens/homepage/home.dart';
import 'package:weather/utils/constants/colors.dart';

import 'splahscreen_viewmodel.dart';

class SplashscreenView extends StatelessWidget {
  const SplashscreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SplashScreenViewModel>.withConsumer(
      viewModelBuilder: () => SplashScreenViewModel(),
      builder: (context, model, child) =>  AnimatedSplashScreen(
          backgroundColor: AppColors.grey,
          splash:Image(image: AssetImage('assets/images/weather.png')),   
          splashTransition: SplashTransition.fadeTransition,
          nextScreen: Home(),
      )
    );
  }
}
