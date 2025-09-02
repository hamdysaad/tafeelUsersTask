import 'package:tafael_task_tlutter_app/presentation/ui_states/user_item_ui_state.dart';

class UsersListState {}

class UsersListStateLoading extends UsersListState {}

class UsersListStateSuccess extends UsersListState {
  final List<UserItemUiState> uiState;
  UsersListStateSuccess({required this.uiState});
}

class UsersListStateError extends UsersListState {
  final Exception exception;

  UsersListStateError(this.exception);
}
