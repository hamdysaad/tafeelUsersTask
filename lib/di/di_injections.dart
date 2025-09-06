import 'package:get_it/get_it.dart';
import 'package:tafael_task_tlutter_app/data/datasources/users_data_source.dart';
import 'package:tafael_task_tlutter_app/domain/usecases/get_user_details_use_case.dart';
import 'package:tafael_task_tlutter_app/domain/usecases/get_users_list_use_case.dart';
import '../data/datasources/dummy/users_dummy_datasource.dart';
import '../data/datasources/remote/base/api_service.dart';
import '../data/datasources/remote/users_remote_datasource.dart';
import '../data/repositories/user_repository.dart';
import '../data/repositories/user_repository_impl.dart';


final sl = GetIt.instance;


class DiInjections {


  DiInjections._();


  static Future<void> init() async {

    // Services
    sl.registerLazySingleton<ApiService>(() => ApiService());

    // Repositories (domain contract -> implementation)
    sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl<UsersDataSource>()));

    /*Data sources*/
    // sl.registerLazySingleton<UsersRemoteDatasource>(() => UsersRemoteDatasource(sl<ApiService>()));
    // sl.registerLazySingleton<UsersDataSource>(() => UsersRemoteDatasource(sl<ApiService>()));
    sl.registerLazySingleton<UsersDataSource>(() => UsersDummyDatasource());

    // Use cases
    sl.registerLazySingleton(() => GetUsersListUseCase(sl<UserRepository>()));
    sl.registerLazySingleton(() => GetUserDetailsUseCase(sl<UserRepository>()));
  }
}
