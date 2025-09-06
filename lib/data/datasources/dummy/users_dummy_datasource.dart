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

    await Future.delayed(const Duration(seconds: 2));

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
    return GetUserDetailsResponse.fromJson(detailsResponseDummy);
  }
}


var detailsResponseDummy = {
  "data": {
    "id": 7,
    "email": "michael.lawson@reqres.in",
    "first_name": "Michael",
    "last_name": "Lawson",
    "avatar": "https://reqres.in/img/faces/7-image.jpg",
  },
};
