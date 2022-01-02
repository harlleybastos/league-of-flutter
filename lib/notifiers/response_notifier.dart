import 'package:flutter/widgets.dart';

class ResponseNotifier extends ChangeNotifier{
  String _responseWindowsText = 'API Response Window';
  String get responseWindowsText => _responseWindowsText;
  void updateResponseWindowsText(responseWindowsText){
    _responseWindowsText = responseWindowsText;
    notifyListeners();
  }

}