import 'package:tafael_task_tlutter_app/data/datasources/remote/requests/GetUsersListRequest.dart';
import 'package:tafael_task_tlutter_app/data/datasources/remote/responses/get_user_details_response.dart';
import '../users_data_source.dart';
import 'base/api_service.dart';
import 'base/end_points.dart';
import 'requests/get_user_details_request.dart';
import 'responses/get_users_list_response.dart';

class UsersRemoteDatasource extends UsersDataSource{

  final ApiService apiService;

  UsersRemoteDatasource(this.apiService);

  @override
  Future<GetUsersListResponse> getUsersList(GetUsersListRequest request) async {

    final map = <String, dynamic>{};
    map['page'] = 2;

    var response = await apiService.getInstance().get(
      EndPoints.getUsersList,
      queryParameters: map,
    );
    return GetUsersListResponse.fromJson(response.data);
  }

  @override
  Future<GetUserDetailsResponse> getUserDetails(GetUserDetailsRequest request) async {
    var response = await apiService.getInstance().get(EndPoints.getUserDetails(2));
    return GetUserDetailsResponse.fromJson(response.data);
  }
}