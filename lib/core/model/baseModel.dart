import 'package:flutter/widgets.dart';
import 'package:weather/utils/locator.dart';
import 'package:weather/utils/progressBarManager/dialogModels.dart';
import 'package:weather/utils/progressBarManager/dialogService.dart';

class BaseModel extends ChangeNotifier {
  final ProgressService _dialogService = locator<ProgressService>();
  ProgressResponse response;
  String lat = '28.644800';
  String lon = '77.216721';
  String state= 'new delhi';

  bool _busy = false;
  bool get busy => _busy;
  
  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
