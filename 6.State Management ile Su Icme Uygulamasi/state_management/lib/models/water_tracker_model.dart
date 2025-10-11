import 'package:flutter/material.dart';

//değişiklik arayan bir sınıf
class WaterTrackerModel with ChangeNotifier {
  final List<String> _waterLog = [];
  //getter tanımlama
  List<String> get waterLog => _waterLog;

  void addLog(String time) {
    _waterLog.add(time);
    notifyListeners();
  }

  void removeLog(int index) {
    _waterLog.removeAt(index);
    notifyListeners();
  }
}
