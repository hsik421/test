import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:untitled/data/Result.dart';
import 'package:untitled/data/WebSocketClient.dart';

import '../data/repository/timeRepository.dart';

class HomeViewModel with ChangeNotifier {
  late final TimeRepository _timeRepository;
  late final WebSocketClient _socketClient;
  String serverTime = "";
  String message = "";
  bool isProgress = false;

  HomeViewModel() {
    _timeRepository = TimeRepository();
    _socketClient = WebSocketClient();
  }

  void connect() {
    _socketClient.setCallback((data) => {
          switch (data) {
            Success() => {
              message = data.data().toString()
            },
            Failure() => {

            },
            Connected() => {

            },
          }
        });
    _socketClient.connect();
  }

  Future<void> load() async {
    isProgress = true;
    notifyListeners();
    serverTime = await _timeRepository.load();
    Future.delayed(Duration(seconds: 5), () {
      isProgress = false;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _socketClient.disconnect();
  }
}
