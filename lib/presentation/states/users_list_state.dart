import 'package:tafael_task_tlutter_app/presentation/ui_states/user_item_ui_state.dart';

class UsersListState {}

class UsersListStateLoading extends UsersListState {}

class UsersListStateSuccess extends UsersListState {
  final List<UserItemUiState> uiState;
  final bool isLoadingMore;
  final bool hasNextPage;

  UsersListStateSuccess({
    required this.uiState,
    this.isLoadingMore = false,
    this.hasNextPage = true,
  });

  UsersListStateSuccess copyWith({
    List<UserItemUiState>? uiState,
    bool? isLoadingMore,
    bool? hasNextPage,
  }) {
    return UsersListStateSuccess(
      uiState: uiState ?? this.uiState,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasNextPage: hasNextPage ?? this.hasNextPage,
    );
  }
}

class UsersListStateError extends UsersListState {
  final Exception exception;

  UsersListStateError(this.exception);
}
