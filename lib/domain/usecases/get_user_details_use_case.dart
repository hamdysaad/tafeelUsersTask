import '../../data/repositories/user_repository.dart';
import '../base/AppResult.dart';
import '../base/base_use_case.dart';
import '../models/user_details_model.dart';
import '../models/user_list_item_model.dart';


class GetUserDetailsUseCase extends BaseUseCase<UserDetailsModel>{

  final UserRepository repository;

  GetUserDetailsUseCase(this.repository);

  Future<AppResult<UserDetailsModel>> execute(int id) async {
    return call(() async {
      var result = await repository.getUserDetails(id);
      return AppResult.success(result);
    },);
  }
}
