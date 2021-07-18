import 'dart:convert';

import 'package:weather/core/model/baseModel.dart';
import 'package:weather/core/model/current_weather.dart';
import 'package:weather/core/model/error_model.dart';
import 'package:weather/core/model/weather_model.dart';
import 'package:weather/core/services/api_service.dart';
import 'package:weather/utils/locator.dart';

class WeeklyViewModel extends BaseModel {
  final WeatherApiService _data = locator<WeatherApiService>();
  CurrentWeather currentWeather;
  WeatherData weatherData;
  List<Daily> dailyData;

  fetchData() async {
    setBusy(true);
    var result = await _data.getCurrent();
    if (result is ErrorModel) {
      print('ERROR:::::::');
      // showToast('Login failed');
      print(result.error);
      notifyListeners();
      throw Exception('Failed to load internet');
      //return ErrorModel(result.error);
    }

    // if (result is SuccessModel) {
    print('GOOOOOOD');
    var data = json.decode(result.data);
    print(json.decode(result.data));
    CurrentWeather weatherList = CurrentWeather.fromJson(data);
    currentWeather = weatherList;
    notifyListeners();
    print(weatherList);

    ///////////////
    
    var dailyResult = await _data.getData();
    if (dailyResult is ErrorModel) {
      print('ERROR:::::::');
      // showToast('Login failed');
      print(dailyResult.error);
      notifyListeners();
      throw Exception('Failed to load internet');
      //return ErrorModel(result.error);
    }

    // if (result is SuccessModel) {
    print('WORKKING');
    var daily = json.decode(dailyResult.data);
     print(json.decode(dailyResult.data));
    WeatherData dailyList = WeatherData.fromJson(daily);
    weatherData = dailyList;

    // var _daily = data.data["daily"];
    // List<Daily> dailyList = List<Daily>.from(_daily.map((item) => Daily.fromJson(item)));
    //  dailyData = dailyList ;
    notifyListeners();
    print(dailyList);
    setBusy(false);
    
     }
  }