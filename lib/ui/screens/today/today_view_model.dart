
import 'package:weather/core/model/baseModel.dart';
import 'package:weather/core/model/error_model.dart';
import 'package:weather/core/model/weather_model.dart';
import 'package:weather/core/services/api_service.dart';
import 'package:weather/utils/locator.dart';

class TodayViewModel extends BaseModel {
  
  final WeatherApiService _movies= locator<WeatherApiService>();
  
   Future<Welcome> fetchCurrent() async {
    //setBusy(true);
    var result = await _movies.getCurrent();
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