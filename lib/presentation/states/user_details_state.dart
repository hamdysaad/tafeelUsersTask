import '../ui_states/user_details_ui_state.dart';

class UserDetailsState {
}

class UserDetailsStateLoading extends UserDetailsState{}

class UserDetailsStateInvalidParam extends UserDetailsState{}
class UserDetailsStateDataNotFound extends UserDetailsState{}

class UserDetailsStateSuccess extends UserDetailsState{
  final UserDetailsUiState uiState;

  UserDetailsStateSuccess({required this.uiState});
}
class UserDetailsStateError extends UserDetailsState{
  final Exception exception;
  UserDetailsStateError(this.exception);
}
