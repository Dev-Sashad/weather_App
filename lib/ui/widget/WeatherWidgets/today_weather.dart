import 'package:flutter/material.dart';
import 'package:weather/core/model/current_weather.dart';
import 'package:weather/utils/constants/colors.dart';
import 'package:weather/utils/constants/screensizer.dart';
import 'package:weather/utils/helpers.dart';
import 'package:weather_icons/weather_icons.dart';

// ignore: must_be_immutable
class TodayWeather extends StatelessWidget {
  final CurrentWeather todayModel;
  // final  String icon;
  TodayWeather({this.todayModel});
  @override
  Widget build(BuildContext context) {
    var hour = formatHour(DateTime.now());
    var iconUrl = "https://openweathermap.org/img/w/" +
        todayModel.weather[0].icon.toString() +
        ".png";
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(todayModel.dt * 1000);
    var uv = (280 * todayModel.clouds.all * 1.06) / (25 * 100);

    return Stack(
      children: [
        Container(
          height: height(0.7, context),
          width: width(1, context),
          padding: EdgeInsets.all(20),
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New Delhi',
                        style: TextStyle(fontSize: 30, color: AppColors.white),
                      ),
                      Text(
                        formatDayMonth(dateTime).toString(),
                        style: TextStyle(fontSize: 15, color: AppColors.white),
                      ),
                      SizedBox(
                        height: sizeBoxValue(context) * 2,
                      ),
                      Text(
                        todayModel.weather[0].description.toString(),
                        style: TextStyle(fontSize: 15, color: AppColors.white),
                      ),
                    ],
                  ),
                  // BoxedIcon(
                  //   WeatherIcons.fromString((int.parse(hour) > 6 && int.parse(hour) < 19) ?"wi-day-"+todayModel.weather[0].description.toString():
                  //    "wi-night-"+todayModel.weather[0].description.toString(),
                  //       fallback: WeatherIcons.na),
                  //   size: 60,
                  //   color: AppColors.white,
                  // ),
                  Image.network(iconUrl, color: Colors.white),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todayModel.main.tempMax.toString(),
                      style: TextStyle(fontSize: 80, color: AppColors.white),
                    ),
                    Text(
                      '°C',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: height(0.7, context),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            height: height(0.3, context),
            width: width(1, context),
            color: AppColors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    ////1st column
                    Column(
                      children: [
                        BoxedIcon(
                          WeatherIcons.thermometer,
                          size: 30,
                          color: AppColors.grey,
                        ),
                        SizedBox(
                          height: sizeBoxValue(context),
                        ),
                        BoxedIcon(
                          WeatherIcons.strong_wind,
                          size: 30,
                          color: AppColors.grey,
                        ),
                      ],
                    ),

                    SizedBox(
                      width: sizeBoxValue(context),
                    ),

                    ////// second column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Feels like',
                              style: TextStyle(
                                  fontSize: 20, color: AppColors.grey),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    '${todayModel.main.feelsLike.toString()} °C',
                                    style: TextStyle(
                                        fontSize: 15, color: AppColors.grey)),
                                SizedBox(width: 10),
                                Text('Today',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: AppColors.blue_light)),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: sizeBoxValue(context) * 2,
                        ),
                        //////////
                        ///
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Wind',
                              style: TextStyle(
                                  fontSize: 20, color: AppColors.grey),
                            ),
                            Text('${todayModel.wind.speed.toString()} km/h',
                                style: TextStyle(
                                    fontSize: 15, color: AppColors.grey)),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        BoxedIcon(
                          WeatherIcons.raindrops,
                          size: 40,
                          color: AppColors.grey,
                        ),
                        //        SizedBox(
                        //   height: sizeBoxValue(context)*2,
                        // ),
                        BoxedIcon(
                          WeatherIcons.day_sunny,
                          size: 30,
                          color: AppColors.grey,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: sizeBoxValue(context),
                    ),
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Humidity',
                              style: TextStyle(
                                  fontSize: 20, color: AppColors.grey),
                            ),
                            Text('${todayModel.main.humidity.toString()} %',
                                style: TextStyle(
                                    fontSize: 15, color: AppColors.grey)),
                          ],
                        ),
                        SizedBox(
                          height: sizeBoxValue(context) * 2,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'UV Index',
                              style: TextStyle(
                                  fontSize: 20, color: AppColors.grey),
                            ),
                            Text('${uv.toStringAsFixed(2)}',
                                style: TextStyle(
                                    fontSize: 15, color: AppColors.grey)),
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
