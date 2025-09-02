import 'package:tafael_task_tlutter_app/data/datasources/remote/users_remote_datasource.dart';
import '../../domain/models/user_details_model.dart';
import '../../domain/models/user_list_item_model.dart';
import '../datasources/remote/requests/GetUsersListRequest.dart';
import '../datasources/remote/requests/get_user_details_request.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {

  final UsersRemoteDatasource remoteDatasource;

  UserRepositoryImpl(this.remoteDatasource);

  @override
  Future<List<UserListItemModel>> getUsers(int page) async {
    var request = GetUsersListRequest(page: page);
    final response = await remoteDatasource.getUsersList(request);
    var usersApiModel = response.data;
    var usersListModel = usersApiModel?.map(
          (e) => UserListItemModel(
        id: e.id ?? 0,
        email: e.email ?? '',
        firstName: e.firstName ?? '',
        lastName: e.lastName ?? '',
        avatar: e.avatar ?? '',
      ),
    ).toList() ?? List.empty();

    return usersListModel;
  }

  @override
  Future<UserDetailsModel> getUserDetails(int id) async {
    var request = GetUserDetailsRequest(id : id);
    final response = await remoteDatasource.getUserDetails(request);
    var userDetailsApiModel = response.data;
    var model = UserDetailsModel(
      id: userDetailsApiModel?.id ?? 0,
      email: userDetailsApiModel?.email ?? '',
      firstName: userDetailsApiModel?.firstName ?? '',
      lastName: userDetailsApiModel?.lastName ?? '',
      avatar: userDetailsApiModel?.avatar ?? '',
    );
    return model;
  }

}
