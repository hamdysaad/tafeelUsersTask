

import 'package:tafael_task_tlutter_app/extensions/safe_json_access.dart';

/// id : 7
/// email : "michael.lawson@reqres.in"
/// first_name : "Michael"
/// last_name : "Lawson"
/// avatar : "https://reqres.in/img/faces/7-image.jpg"

class UserListItemApiModel {

  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  UserListItemApiModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,});

  UserListItemApiModel.fromJson(Map<String, dynamic> json) {
    id = json.getValueOrNull('id');
    email = json.getValueOrNull('email');
    firstName = json.getValueOrNull('first_name');
    lastName = json.getValueOrNull('last_name');
    avatar = json.getValueOrNull('avatar');
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['avatar'] = avatar;
    return map;
  }

}
