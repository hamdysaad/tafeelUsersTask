

import 'package:flutter/material.dart';
import 'package:tafael_task_tlutter_app/domain/usecases/get_user_details_use_case.dart';
import 'package:tafael_task_tlutter_app/domain/usecases/get_users_list_use_case.dart';

import '../states/user_details_state.dart';
import '../states/users_list_state.dart';
import '../ui_states/user_details_ui_state.dart';
import '../ui_states/user_item_ui_state.dart';


class UserDetailsProvider with ChangeNotifier {

  final GetUserDetailsUseCase _getUserDetailsUseCase;

  final int? userId;

  UserDetailsProvider(this._getUserDetailsUseCase, this.userId);

  UserDetailsState state = UserDetailsStateLoading();

  Future<void> initLoadUserDetails() async {

    // await Future.delayed(const Duration(seconds: 4));


    /*Check if id not found or invalid*/
    int? userId = this.userId;
    if(userId == null){
      updateState(UserDetailsStateInvalidParam());
      return;
    }

    var result  = await _getUserDetailsUseCase.execute(userId);

    var model = result.data;

    /*check if data not found*/
    if(model == null){
      updateState(UserDetailsStateDataNotFound());
      return;
    }

    if(result.isSuccess){
      var uiState = UserDetailsUiState(
        id: model.id,
        email: model.email,
        firstName: model.firstName,
        lastName: model.lastName,
        avatar: model.avatar,
      );
      updateState(UserDetailsStateSuccess(uiState: uiState));
      return;
    }

    updateState(UserDetailsStateError(result.error!));
  }

  void updateState(UserDetailsState state) {
    this.state = state;
    notifyListeners();

  }

}
