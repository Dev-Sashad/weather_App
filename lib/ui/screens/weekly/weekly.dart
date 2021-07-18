import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:weather/ui/widget/WeatherWidgets/weekly_weather.dart';
import 'package:weather/utils/constants/screensizer.dart';
import 'weekly_view_model.dart';

class Weekly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<WeeklyViewModel>.withConsumer(
        onModelReady: (v) {
          v.fetchData();
        },
        viewModelBuilder: () => WeeklyViewModel(),
       
        builder: (context, model, child) {
          return Scaffold(
              body:  model.busy
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    strokeWidth: 3,
                  ),
                )
              : Container(
                  height: height(1, context),
                  width: width(1, context),
                  decoration: BoxDecoration(color: Colors.indigo[900]),
                  child: Stack(
                    children: [
                      WeeklyWeather(weeklyModel: model.currentWeather),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.65,
                          child: ListView(
                              children: model.weatherData.daily
                                  .map((feed) => WeeklyWeatherTile(
                                        weeklyModel: feed,
                                        weatherData: model.weatherData,
                                      ))
                                  .toList()),
                        ),
                      )
                    ],
                  )));
        });
  }
}
