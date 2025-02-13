import 'dart:async';

import 'package:untitled/data/Result.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketClient {
  late final WebSocketChannel _channel;
  late Function(Result) _result;
  Timer? _timer;

  void connect() {
    _channel = WebSocketChannel.connect(Uri.parse('wss://ws.bitget.com/v2/ws/public'));
    startSocketPingPong();
    _channel.stream.listen(
      (data) {

        print('Received: ${data.toString()}');
        // _result(Success(data));
      },
      onDone: () {
        print('WebSocket connection closed reason = ${_channel.closeReason}');
        _result(Failure(Exception('WebSocket connection closed')));
        disconnect();
      },
      onError: (error) {
        print('WebSocket error: \$error');
        _result(Failure(Exception('WebSocket error: \$error')));
        disconnect();
      },
    );
  }

  void setCallback(Function(Result) callback) => _result = callback;

  void startSocketPingPong() {
    print("startSocketPingPong");
    _timer = Timer.periodic(Duration(seconds: 30), (timer) {
      String message = 'ping';
      _channel.sink.add(message);
      print('Send: ${message}');
    });
  }

  void stopSocketPingPong() {
    _timer?.cancel();
  }

  void disconnect() {
    stopSocketPingPong();
    _channel.sink.close();
  }
}
