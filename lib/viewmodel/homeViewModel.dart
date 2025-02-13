import 'dart:async';

import 'package:flutter/widgets.dart';

import '../data/repository/timeRepository.dart';

class HomeViewModel with ChangeNotifier {
  late final TimeRepository _timeRepository;
  String serverTime = "";
  bool isProgress = false;
  HomeViewModel() {
    _timeRepository = TimeRepository();
  }

  Future<void> load() async {
    isProgress = true;
    notifyListeners();
    serverTime = await _timeRepository.load();
    Future.delayed(Duration(seconds: 5),(){
      isProgress = false;
      notifyListeners();
    });
  }

  void test(){

  }
}
