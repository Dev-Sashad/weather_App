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
  WeatherData weatherData;
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
     
      // if (result is SuccessModel) {
       print('GOOOOOOD');
      var data = json.decode(result.data); 
      print(json.decode(result.data));
      CurrentWeather weatherList = CurrentWeather.fromJson(data);  
       currentWeather = weatherList ;
       notifyListeners();
       print(weatherList);
       return weatherList;

  //  }
   }


  fetchData() async {
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
    
    // if (result is SuccessModel) {
       print('WORKKING');
      var data = json.decode(result.data); 
      print(json.decode(result.data));
      WeatherData weatherList = WeatherData.fromJson(data);  
       weatherData = weatherList ;

      // var _daily = data.data["daily"]; 
      // List<Daily> dailyList = List<Daily>.from(_daily.map((item) => Daily.fromJson(item))); 
      //  dailyData = dailyList ;
       notifyListeners();
       print(weatherList);
       return weatherList;

  //  }     
  }  
}