

import '../../utils/LogUtils.dart';

class ErrorResponse {
  ErrorResponse({
      this.status, 
      this.message,});

  ErrorResponse.fromJson(dynamic json) {

    try{

      if(json == null) return;

      if (json['status'] != null) {
        status = json['status'];
      }

      if (json['message'] != null) {
        message = json['message'];
      }
    }catch(ex){
      appLog("ErrorResponse ex:${ex.toString()}");
    }

  }
  String? status;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    return map;
  }

}