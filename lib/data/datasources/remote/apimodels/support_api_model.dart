


import 'package:tafael_task_tlutter_app/extensions/safe_json_access.dart';

/// url : "https://contentcaddy.io?utm_source=reqres&utm_medium=json&utm_campaign=referral"
/// text : "Tired of writing endless social media content? Let Content Caddy generate it for you."

class SupportApiModel {
  SupportApiModel({
    this.url,
    this.text,});

  SupportApiModel.fromJson(Map<String, dynamic> json) {
    url = json.getValueOrNull('url');
    text = json.getValueOrNull('text');
  }
  String? url;
  String? text;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['text'] = text;
    return map;
  }

}
