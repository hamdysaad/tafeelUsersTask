import 'package:flutter/material.dart';

import '../ui_states/user_item_ui_state.dart';
import 'user_avatar_widget.dart';
import 'user_email_widget.dart';
import 'user_full_name_widget.dart';

class UserItemWidget extends StatelessWidget {
  final UserItemUiState uiState;
  final Function(UserItemUiState) onItemClick;

  const UserItemWidget({
    super.key,
    required this.uiState,
    required this.onItemClick,
  });

  // @override
  // Widget build(BuildContext context) {
  //   return ListTile(
  //     leading: _userImage(),
  //     title: _name(),
  //     subtitle: Text(uiState.email),
  //     onTap: () {
  //       onItemClick(uiState);
  //     },
  //   );
  // }
  //
  // Widget _userImage() => CircleAvatar(backgroundImage: NetworkImage(uiState.avatar));
  //
  // Widget _name() => Text('${uiState.firstName} ${uiState.lastName}');

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _avatar(),
      title: _name(),
      subtitle: _email(),
      onTap: () {
        onItemClick(uiState);
      },
    );
  }

  _avatar() {
    return UserAvatarWidget(url: uiState.avatar);
  }

  _email() {
    return UserEmailWidget(email: uiState.email);
  }

  _name() {
    return UserFullNameWidget(
      firstName: uiState.firstName,
      lastName: uiState.lastName,
      style: TextStyle(),
    );
  }
}
