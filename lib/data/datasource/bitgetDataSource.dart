import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

import '../model/timeModel.dart';

class BitgetDataSource {
  String apiKey = "YOUR_API_KEY";
  String secretKey = "YOUR_SECRET_KEY";
  String passphrase = "YOUR_PASSPHRASE";
  String baseUrl = "api.bitget.com";

  String generateSignature(
      String method, String requestPath, String body, int timestamp) {
    String message = "$timestamp$method$requestPath$body";
    var key = utf8.encode(secretKey);
    var bytes = utf8.encode(message);
    var hmacSha256 = Hmac(sha256, key);
    var digest = hmacSha256.convert(bytes);
    return base64Encode(digest.bytes);
  }

  Future<String> getServerTime() async {
    var uri = Uri.https(baseUrl, "/api/v2/public/time");
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      var data = TimeResponse.fromJson(jsonResponse).data?.serverTime;
      if (data != null) {
        return data;
      }
    }
    return "-1";
  }

  // Future<void> test() async {
  //   String path = "/api/spot/v1/public/time";
  //   int timestamp = getTimeStamp();
  //   String sign = generateSignature("GET", path, "", timestamp);
  //
  //   var headers = {
  //     "ACCESS-KEY": apiKey,
  //     "ACCESS-SIGN": sign,
  //     "ACCESS-TIMESTAMP": "$timestamp",
  //     "ACCESS-PASSPHRASE": passphrase,
  //     "Content-Type": "application/json",
  //   };
  //
  //   var response = await http.get(Uri.parse("$baseUrl$path"), headers: headers);
  //
  //   if (response.statusCode == 200) {
  //     print("Server Time: ${response.body}");
  //   } else {
  //     print("Error: ${response.body}");
  //   }
  // }

  int getTimeStamp() {
    return DateTime.now().millisecondsSinceEpoch;
  }
}
