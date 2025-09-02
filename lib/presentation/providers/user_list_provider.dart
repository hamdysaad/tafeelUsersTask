
import 'package:flutter/material.dart';
import 'package:tafael_task_tlutter_app/domain/usecases/get_users_list_use_case.dart';

import '../states/users_list_state.dart';
import '../ui_states/user_item_ui_state.dart';


class UserListProvider with ChangeNotifier {

  final GetUsersListUseCase _getUsersUseCase;

  UserListProvider(this._getUsersUseCase);

  UsersListState state = UsersListStateLoading();

  int _page = 1;


  Future<void> initLoadUsers() async {

    // await Future.delayed(const Duration(seconds: 4));

    _page = 1;

    var result  = await _getUsersUseCase.execute(_page);

    if(result.isSuccess){
      var uiStates = result.data?.map((e) => UserItemUiState(
        id: e.id,
        email: e.email,
        firstName: e.firstName,
        lastName: e.lastName,
        avatar: e.avatar,
      )).toList() ?? List.empty();
      updateState(UsersListStateSuccess(uiState: uiStates));
      return;
    }

    updateState(UsersListStateError(result.error!));
  }

  void updateState(UsersListState state) {
    this.state = state;
    notifyListeners();
  }
}
