
import 'package:flutter/material.dart';
import 'package:tafael_task_tlutter_app/domain/models/user_list_item_model.dart';
import 'package:tafael_task_tlutter_app/domain/usecases/get_users_list_use_case.dart';

import '../states/users_list_state.dart';
import '../ui_states/user_item_ui_state.dart';


class UserListProvider with ChangeNotifier {

  final GetUsersListUseCase _getUsersUseCase;

  UserListProvider(this._getUsersUseCase);

  UsersListState state = UsersListStateLoading();
  int _page = 1;

  Future<void> initLoadUsers() async {
    _page = 1;
    var result  = await _getUsersUseCase.execute(_page);
    if(result.isSuccess){
      var uiStates = _getUsersUiStateFromApiModel(result.data);
      updateState(UsersListStateSuccess(uiState: uiStates));
      return;
    }
    updateState(UsersListStateError(result.error!));
  }

  void updateState(UsersListState state) {
    this.state = state;
    notifyListeners();
  }

  Future<void> loadMore() async {
    _page++;
    var state = this.state;
    if(state is UsersListStateSuccess){
      updateState(state.copyWith(isLoadingMore: true));
      var result  = await _getUsersUseCase.execute(_page);
      if(result.isSuccess){
        var uiStates = _getUsersUiStateFromApiModel(result.data);
        var allItems = state.uiState;
        allItems.addAll(uiStates);

        updateState(state.copyWith(
          uiState: allItems,
          isLoadingMore: false,
          hasNextPage: uiStates.isNotEmpty,
        ));

        return;
      }

      updateState(UsersListStateError(result.error!));
    }

  }

  List<UserItemUiState> _getUsersUiStateFromApiModel(List<UserListItemModel>? data) {
    return data?.map((e) => UserItemUiState(
      id: e.id,
      email: e.email,
      firstName: e.firstName,
      lastName: e.lastName,
      avatar: e.avatar,
    )).toList() ?? List.empty();
  }
}
