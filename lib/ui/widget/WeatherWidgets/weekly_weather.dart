import 'package:flutter/material.dart';
import 'package:weather/core/model/current_weather.dart';
import 'package:weather/core/model/weather_model.dart';
import 'package:weather/utils/constants/colors.dart';
import 'package:weather/utils/constants/screensizer.dart';
import 'package:weather/utils/helpers.dart';
import 'package:weather_icons/weather_icons.dart';

// ignore: must_be_immutable
class WeeklyWeather extends StatelessWidget {
  final CurrentWeather weeklyModel;
  WeeklyWeather({this.weeklyModel});
  // DateTime date = formatTime(
  //     DateTime.now().subtract(Duration(hours: 24, minutes: 00, seconds: 00)));
  @override
  Widget build(BuildContext context) {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(weeklyModel.dt * 1000);
    return Container(
      height: height(0.35, context),
      width: width(1, context),
      padding: EdgeInsets.all(20),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: sizeBoxValue(context) * 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'New Delhi',
                    style: TextStyle(fontSize: 20, color: AppColors.white),
                  ),
                  Text(
                    '${formatDayMonth(dateTime)}',
                    style: TextStyle(fontSize: 10, color: AppColors.white),
                  ),
                  SizedBox(
                    height: sizeBoxValue(context) * 2,
                  ),
                  Text(
                    weeklyModel.weather.map((e) => e.description).toString(),
                    style: TextStyle(fontSize: 15, color: AppColors.white),
                  ),
                ],
              ),
              BoxedIcon(
                WeatherIcons.fromString(
                    weeklyModel.weather.map((e) => e.icon).toString(),
                    fallback: WeatherIcons.na),
                size: 30,
                color: AppColors.white,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text( weeklyModel.main.tempMax.toString(),
                  style: TextStyle(fontSize: 40, color: AppColors.white),
                ),
                Text(
                  '°C',
                  style: TextStyle(fontSize: 15, color: AppColors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class WeeklyWeatherTile extends StatelessWidget {
  final Daily weeklyModel;
  WeeklyWeatherTile({this.weeklyModel});
  // DateTime date = formatTime(
  //     DateTime.now().subtract(Duration(hours: 24, minutes: 00, seconds: 00)));
  @override
  Widget build(BuildContext context) {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(weeklyModel.dt * 1000);
    return Container(
        alignment: Alignment.center,
        height: 60,
        width: width(1, context),
        padding: EdgeInsets.all(20),
        color: AppColors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BoxedIcon(
              WeatherIcons.fromString(
                  weeklyModel.weather.map((e) => e.icon).toString(),
                  fallback: WeatherIcons.na),
              size: 30,
              color: AppColors.grey,
            ),
            Text('${formatDay(dateTime)}',
                style: TextStyle(fontSize: 15, color: AppColors.grey)),
            Text(
                '${weeklyModel.temp.morn.toString()} °/° ${weeklyModel.temp.eve.toString()}',
                style: TextStyle(fontSize: 15, color: AppColors.grey)),
            Text('${weeklyModel.weather.map((e) => e.description).toString()}',
                style: TextStyle(fontSize: 15, color: AppColors.grey))
          ],
        ));
  }
}
