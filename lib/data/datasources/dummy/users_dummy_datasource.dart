import 'package:tafael_task_tlutter_app/data/datasources/remote/requests/GetUsersListRequest.dart';
import 'package:tafael_task_tlutter_app/data/datasources/remote/responses/get_user_details_response.dart';
import '../users_data_source.dart';
import '../remote/base/api_service.dart';
import '../remote/base/end_points.dart';
import '../remote/requests/get_user_details_request.dart';
import '../remote/responses/get_users_list_response.dart';

class UsersDummyDatasource extends UsersDataSource{

  List<Map<String, dynamic>>  dummyData = [];

  List<String> imagesUrls = [
    "https://reqres.in/img/faces/7-image.jpg",
    "https://reqres.in/img/faces/8-image.jpg",
    "https://reqres.in/img/faces/9-image.jpg",
    "https://reqres.in/img/faces/10-image.jpg",
    "https://reqres.in/img/faces/11-image.jpg",
    "https://reqres.in/img/faces/12-image.jpg",
  ];

  UsersDummyDatasource(){
    dummyData = [];
    for(int i = 0; i < 200; i++){
      var id = i + 1;
      Map<String, dynamic> dummyDataItem =    {
        "id": id,
        "email": "michael$id.lawson@reqres.in",
        "first_name": "Michael $id",
        "last_name": "Lawson $id",
        "avatar": imagesUrls[i%imagesUrls.length],
      };
      dummyData.add(dummyDataItem);
    }
  }


  @override
  Future<GetUsersListResponse> getUsersList(GetUsersListRequest request) async {
    List<Map<String, dynamic>> items = [];
    var page = request.page ?? 1;
    // var page = 6;
    var pageSize = 30;
    final startIndex = (page-1) * pageSize;
    if (startIndex >= dummyData.length) {
      items = [];
    }else {
      int  endIndex = startIndex + pageSize;
      items =  dummyData.sublist(
        startIndex,
        endIndex > dummyData.length ? dummyData.length : endIndex,
      );
    }

    await Future.delayed(const Duration(milliseconds: 500));

    var responseDummy = {
      "page": page,
      "per_page": pageSize,
      "total": dummyData.length,
      "total_pages": (dummyData.length / pageSize).ceil(),
      "data": items
    };

    return GetUsersListResponse.fromJson(responseDummy);
  }

  @override
  Future<GetUserDetailsResponse> getUserDetails(GetUserDetailsRequest request) async {
    Map<String, dynamic> item  = dummyData.firstWhere((element) => element['id'] ==  request.id);
    var detailsResponseDummy = {
      "data": item,
    };
    return GetUserDetailsResponse.fromJson(detailsResponseDummy);
  }
}


var detailsResponseDummy = {
  "data": {
    "id": 2,
    "email": "janet.weaver@reqres.in",
    "first_name": "Janet",
    "last_name": "Weaver",
    "avatar": "https://reqres.in/img/faces/2-image.jpg"
  },
  "support": {
    "url": "https://contentcaddy.io?utm_source=reqres&utm_medium=json&utm_campaign=referral",
    "text": "Tired of writing endless social media content? Let Content Caddy generate it for you."
  }
};
