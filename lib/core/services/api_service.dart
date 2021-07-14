import 'package:weather/core/model/baseModel.dart';
import 'package:weather/core/model/error_model.dart';
import 'package:weather/core/model/weather_model.dart';
import 'package:weather/utils/helpers.dart';
import 'package:weather/utils/http/api_keys.dart';
import 'package:weather/utils/http/paths.dart';

import 'index.dart';

class WeatherApiService extends BaseModel{

  getData() async {
    try {
      final result = await http.get(Paths.pathUrl + Paths.lat + lat + Paths.lon + lon + Paths.units + Paths.exclude + Paths.completeApi + apiKey);
      if (result is ErrorModel) {
        print("ERROR");
        showErrorToast('Fetch failed');
        print(result.error);
        var data = result.error;
        WeatherData  postList = WeatherData.fromJson(data);
         return ErrorModel(postList);

      }

      var data = result.data; 
     WeatherData  weatherList = WeatherData.fromJson(data);   
      return weatherList;
    } catch (e) {
      print(e.toString());
      return ErrorModel('$e');
    }
  }

  getCurrent() async{
    try{
    final result = await http.get(Paths.currentPath+ state+ Paths.units + Paths.completeApi + apiKey);
     if (result is ErrorModel) {
        print("ERROR");
        showErrorToast('Fetch failed');
        print(result.error);
        var data = result.error;
        WeatherData  postList = WeatherData .fromJson(data);
         return ErrorModel(postList);

      }

      var data = result; 
      WeatherData  weatherList = WeatherData .fromJson(data);   
      return weatherList;
    } catch (e) {
      print(e.toString());
      return ErrorModel('$e');
    }
  }
}
