import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:weather/ui/widget/WeatherWidgets/today_weather.dart';
import 'package:weather/utils/constants/screensizer.dart';
import 'today_view_model.dart';

class Today extends StatelessWidget {
  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<TodayViewModel>.withConsumer(
        onModelReady: (v) {
          v.fetchCurrent();
        },
        viewModelBuilder: () => TodayViewModel(),
        builder: (context, model, child) {
          return Scaffold(
                  body:  model.busy
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    strokeWidth: 3,
                  ),
                )
              :  Container(
                      height: height(1, context),
                      width: width(1, context),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/images/background.png"),
                        fit: BoxFit.cover,
                      )),
                      child: TodayWeather(todayModel: model.currentWeather)));
        });
  }
}
