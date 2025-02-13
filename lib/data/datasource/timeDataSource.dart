import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/data/model/timeModel.dart';

class TimeDataSource {
  Future<String> load() async {
    var uri = Uri.https("api.bitget.com", "/api/v2/public/time");
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      var data = TimeResponse.fromJson(jsonResponse).data?.serverTime;
      if (data != null) {
        return data;
      }
    }
    return "empty";
  }
}
