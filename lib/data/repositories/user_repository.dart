import '../../domain/models/user_details_model.dart';
import '../../domain/models/user_list_item_model.dart';

abstract class UserRepository {
  Future<List<UserListItemModel>> getUsers(int page);
  Future<UserDetailsModel> getUserDetails(int id);
}
