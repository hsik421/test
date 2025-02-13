class TimeResponse {
  String? code;
  String? msg;
  int? requestTime;
  Time? data;

  TimeResponse({this.code, this.msg, this.requestTime, this.data});

  TimeResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    requestTime = json['requestTime'];
    data = Time.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['code'] = code;
    map['msg'] = msg;
    map['requestTime'] = requestTime;
    map['data'] = data;
    return map;
  }
}

class Time {
  String? serverTime;

  Time({this.serverTime});

  Time.fromJson(Map<String, dynamic> json) {
    serverTime = json['serverTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['serverTime'] = serverTime;
    return map;
  }
}
