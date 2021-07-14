import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:weather/core/model/current_weather.dart';
import 'package:weather/core/model/weather_model.dart';
import 'package:weather/ui/widget/WeatherWidgets/weekly_weather.dart';
import 'package:weather/utils/constants/screensizer.dart';
import 'weekly_view_model.dart';

class Weekly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<WeeklyViewModel>.withConsumer(
      onModelReady: (v){
        v.fetchCurrent();
        v.fetchData();
      },
        viewModelBuilder: () => WeeklyViewModel(),
        builder: (context, model, child) {
          return Scaffold(
              body: Container(
                  height: height(1, context),
                  width: width(1, context),
                  decoration: BoxDecoration(color: Colors.indigo[900]),
                  child: Stack(
                    children: [
                      WeeklyWeather(weeklyModel: model.currentWeather),

                      FutureBuilder<List<Daily>>(
                          future: model.fetchData(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                             
                                    return Positioned(
                                        top: height(0.65, context),
                                        child: ListView(
                                shrinkWrap: true,
                                children: model.dailyData
                                    .map((feed) => WeeklyWeatherTile(weeklyModel: feed))
                                    .toList()));
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text(
                                "An Error Occured",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ));
                            }

                            return Center(
                                child: Container(
                                    height: 50,
                                    width: 50,
                                    child: CircularProgressIndicator(
                                      backgroundColor: Colors.white,
                                    )));
                          })
                    ],
                  )));
        });
  }
}
