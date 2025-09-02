/// page : 1

class GetUsersListRequest {

  int? page;


  GetUsersListRequest({
      this.page,});

  GetUsersListRequest.fromJson(dynamic json) {
    page = json['page'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    return map;
  }

}