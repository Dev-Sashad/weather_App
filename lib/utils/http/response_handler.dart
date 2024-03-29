import 'package:http/http.dart' as http;
import 'package:weather/core/model/error_model.dart';

handleResponse(http.Response response) {
  try {
    print('ResponseCode:: ${response.statusCode},   ResponseBody:: ${response.body}');

    final int code = response.statusCode;
    final dynamic body = response.body;
    if(code == 200 || code == 201) {
      return body;
    }

    return ErrorModel(body['message']);
  } catch(ex) {
    print(ex.toString());
    return ErrorModel('Request failed');
  }
}
