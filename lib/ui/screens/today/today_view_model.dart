
import 'dart:convert';

import 'package:weather/core/model/baseModel.dart';
import 'package:weather/core/model/current_weather.dart';
import 'package:weather/core/model/error_model.dart';
import 'package:weather/core/model/success_model.dart';
import 'package:weather/core/services/api_service.dart';
import 'package:weather/utils/locator.dart';

class TodayViewModel extends BaseModel {
  
  final WeatherApiService _data= locator<WeatherApiService>();
  
  CurrentWeather currentWeather;
  List<Weather> weather;

  //  delay()async{
  //  await Future.delayed(Duration(milliseconds: 200));
  // }

  fetchCurrent() async {
     //setBusy(true);
     var result = await _data.getCurrent();
     if (result is ErrorModel) {
       print('ERROR:::::::');
       // showToast('Login failed');
       print(result.error);
      //  notifyListeners();
       throw Exception('Failed to load internet');
       //return ErrorModel(result.error);
     }
      
    // if (result is SuccessModel) {
       print('ASASAS');
      var data = json.decode(result.data); 
      print(json.decode(result.data));
      CurrentWeather weatherList = CurrentWeather.fromJson(data);  
       currentWeather = weatherList ;
       notifyListeners();
       print(weatherList);
       return weatherList;

  //  }
  }
}