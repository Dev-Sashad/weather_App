import 'package:weather/core/model/baseModel.dart';
import 'package:weather/core/model/current_weather.dart';
import 'package:weather/core/model/error_model.dart';
import 'package:weather/core/model/weather_model.dart';
import 'package:weather/core/services/api_service.dart';
import 'package:weather/utils/locator.dart';

class WeeklyViewModel extends BaseModel {
  

  final WeatherApiService _data= locator<WeatherApiService>();


  Future<WeatherData> fetchData() async {
    //setBusy(true);
    var result = await _data.getData();
    if (result is ErrorModel) {
      print(result.error);
      notifyListeners();
      throw Exception('Failed to load internet');
      //return ErrorModel(result.error);
    }
    print(result);
    return result;
  }



   Future<CurrentWeather> fetchCurrent() async {
    //setBusy(true);
    var result = await _data.getCurrent();
    if (result is ErrorModel) {
      // showToast('Login failed');
      print(result.error);
      notifyListeners();
      throw Exception('Failed to load internet');
      //return ErrorModel(result.error);
    }
    print(result);
    return result;
  }
}