import 'dart:convert';

import 'package:weather/core/model/baseModel.dart';
import 'package:weather/core/model/current_weather.dart';
import 'package:weather/core/model/error_model.dart';
import 'package:weather/core/model/success_model.dart';
import 'package:weather/core/model/weather_model.dart';
import 'package:weather/core/services/api_service.dart';
import 'package:weather/utils/locator.dart';

class WeeklyViewModel extends BaseModel {
  

  final WeatherApiService _data= locator<WeatherApiService>();

  CurrentWeather currentWeather;
  List<Daily> dailyData;

  fetchCurrent() async {
     //setBusy(true);
     var result = await _data.getCurrent();
     if (result is ErrorModel) {
       print('ERROR:::::::');
       // showToast('Login failed');
       print(result.error);
       notifyListeners();
       throw Exception('Failed to load internet');
       //return ErrorModel(result.error);
     }
     if (result is SuccessModel) {
       print('ASASAS');
       print(json.decode(result.data));
       CurrentWeather weatherList = CurrentWeather.fromJson(json.decode(result.data));
       currentWeather = weatherList;
       print(weatherList);
       return weatherList;
     }
  }

  Future<List<Daily>> fetchData() async {
 //setBusy(true);
     var result = await _data.getData();
     if (result is ErrorModel) {
       print('ERROR:::::::');
       // showToast('Login failed');
       print(result.error);
       notifyListeners();
       throw Exception('Failed to load internet');
       //return ErrorModel(result.error);
     }
    
    if (result is SuccessModel) {
      
       print('ASASAS');
       print(json.decode(result.data));
       var data = result.data["results"];
       List<Daily> weatherList = List<Daily>.from(
          data.map((item) => Daily.fromJson(item)));
       dailyData = weatherList;
       print(weatherList);
       return weatherList;
    }
     
  }
   
}