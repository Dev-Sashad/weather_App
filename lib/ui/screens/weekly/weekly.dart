import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:weather/core/model/weather_model.dart';
import 'package:weather/ui/widget/WeatherWidgets/weekly_weather.dart';
import 'package:weather/utils/constants/screensizer.dart';
import 'weekly_view_model.dart';

class Weekly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<WeeklyViewModel>.withConsumer(
        viewModelBuilder: () => WeeklyViewModel(),
        builder: (context, model, child) {
          return Scaffold(
              body: Container(
                  height: height(1, context),
                  width: width(1, context),
                  decoration: BoxDecoration(color: Colors.indigo[900]),
                  child: Stack(
                    children: [
                      FutureBuilder<Welcome>(
                          future: model.fetchCurrent(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              WeeklyWeather(weeklyModel: snapshot.data);
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
                          }),
                      FutureBuilder<Welcome>(
                          future: model.fetchData(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              Positioned(
                                  top: height(0.65, context),
                                  child: WeeklyWeatherTile(
                                      weeklyModel: snapshot.data));
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
