import 'package:flutter/material.dart';
import 'package:weather/core/model/weather_model.dart';
import 'package:weather/utils/constants/colors.dart';
import 'package:weather/utils/constants/screensizer.dart';
import 'package:weather/utils/helpers.dart';
import 'package:weather_icons/weather_icons.dart';

// ignore: must_be_immutable
class WeeklyWeather extends StatelessWidget {
  final Welcome weeklyModel;
  WeeklyWeather({this.weeklyModel});
   DateTime date = formatTime(
      DateTime.now().subtract(Duration(hours: 24, minutes: 00, seconds: 00)));
  @override
  Widget build(BuildContext context) {   
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
                       '${formatDayMonth(DateTime.tryParse(weeklyModel.daily.map((e) => e.dt).toString() + weeklyModel.timezone).toUtc())}',
                        style: TextStyle(fontSize: 10, color: AppColors.white),
                      ),
                      SizedBox(
                        height: sizeBoxValue(context) * 2,
                      ),
                      Text(
                        weeklyModel.daily.map((e) => e.weather.map((e) => e.description)).toString(),
                        style: TextStyle(fontSize: 15, color: AppColors.white),
                      ),
                    ],
                  ),
                  BoxedIcon(
                    WeatherIcons.fromString(weeklyModel.daily.map((e) => e.weather.map((e) => e.icon)).toString(),
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
                    Text(
                     date.hour.toInt() < 12 ? weeklyModel.daily.map((e) => e.temp.morn).toString(): weeklyModel.daily.map((e) => e.temp.eve).toString(),
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
  final Welcome weeklyModel;
  WeeklyWeatherTile ({this.weeklyModel});
  DateTime date = formatTime(
      DateTime.now().subtract(Duration(hours: 24, minutes: 00, seconds: 00)));
  @override
  Widget build(BuildContext context) {   
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
                    WeatherIcons.fromString(weeklyModel.daily.map((e) => e.weather.map((e) => e.icon)).toString(),
                        fallback: WeatherIcons.na),
                    size: 30,
                    color: AppColors.grey,
                  ),

              Text('${formatDay(DateTime.tryParse(weeklyModel.daily.map((e) => e.dt).toString() + weeklyModel.timezone).toUtc()).toString()}', style: TextStyle(fontSize: 15, color: AppColors.grey)),

              Text('${weeklyModel.daily.map((e) => e.temp.morn.toString())} °/° ${weeklyModel.daily.map((e) => e.temp.eve.toString())}', 
              style: TextStyle(fontSize: 15, color: AppColors.grey)),

              Text('${weeklyModel.daily.map((e) => e.weather.map((e) => e.description)).toString()}', style: TextStyle(fontSize: 15, color: AppColors.grey) )
          ],) 
        );      
  }
}
