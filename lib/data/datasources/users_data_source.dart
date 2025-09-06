


import 'remote/requests/GetUsersListRequest.dart';
import 'remote/requests/get_user_details_request.dart';
import 'remote/responses/get_user_details_response.dart';
import 'remote/responses/get_users_list_response.dart';

abstract class UsersDataSource {

  Future<GetUsersListResponse> getUsersList(GetUsersListRequest request);
  Future<GetUserDetailsResponse> getUserDetails(GetUserDetailsRequest request);
}
