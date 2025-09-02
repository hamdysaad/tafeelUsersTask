import '../../data/repositories/user_repository.dart';
import '../base/AppResult.dart';
import '../base/base_use_case.dart';
import '../models/user_list_item_model.dart';

class GetUsersListUseCase extends BaseUseCase<List<UserListItemModel>>{

  final UserRepository repository;

  GetUsersListUseCase(this.repository);

  Future<AppResult<List<UserListItemModel>>> execute(int page) async {
    return call(() async {
      var result = await repository.getUsers(page);
      return AppResult.success(result);
    },);
  }
}
