import '../apimodels/user_details_api_model.dart';

/// data : {"id":7,"email":"michael.lawson@reqres.in","first_name":"Michael","last_name":"Lawson","avatar":"https://reqres.in/img/faces/7-image.jpg"}

class GetUserDetailsResponse {

  UserDetailsApiModel? data;

  GetUserDetailsResponse({
      this.data,});

  GetUserDetailsResponse.fromJson(dynamic json) {
    data = json['data'] != null ? UserDetailsApiModel.fromJson(json['data']) : null;
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

