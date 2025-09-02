import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tafael_task_tlutter_app/presentation/ui_states/user_details_ui_state.dart';
import 'package:tafael_task_tlutter_app/presentation/widgets/user_avatar_widget.dart';
import 'package:tafael_task_tlutter_app/presentation/widgets/user_email_widget.dart';
import 'package:tafael_task_tlutter_app/presentation/widgets/user_full_name_widget.dart';
import '../../di/di_injections.dart';
import '../../domain/usecases/get_user_details_use_case.dart';
import '../providers/user_details_provider.dart';
import '../states/user_details_state.dart';

class UserDetailScreen extends StatefulWidget {
  final int? userId;

  const UserDetailScreen({super.key, required this.userId});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:
          (context) => UserDetailsProvider(sl<GetUserDetailsUseCase>(), widget.userId)..initLoadUserDetails(),
      child: Scaffold(
        appBar: AppBar(title: const Text('User Detail'), centerTitle: true),
        body: _body(),
      ),
    );
  }

  _body() {
    return Consumer<UserDetailsProvider>(
      builder: (context, provider, _) {
        var state = provider.state;
        switch (state) {
          case UserDetailsStateLoading():
            return _loading();
          case UserDetailsStateInvalidParam():
            return _invalidParam(state);
          case UserDetailsStateDataNotFound():
            return _datNotFound(state);
          case UserDetailsStateSuccess():
            return _content(state);
        }
        return Container();
      },
    );
  }

  _loading() {
    return Center(child: CircularProgressIndicator());
  }

  _invalidParam(UserDetailsStateInvalidParam state) {
    return Center(child: Text('Invalid Param'));
  }

  _datNotFound(UserDetailsStateDataNotFound state) {
    return Center(child: Text('User Detail not found'));
  }

  _content(UserDetailsStateSuccess state) {
    var uiState = state.uiState;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        spacing: 20,
        children: [_avatar(uiState), _name(uiState), _email(uiState)],
      ),
    );
  }

  _avatar(UserDetailsUiState uiState) {
    return UserAvatarWidget(url: uiState.avatar , radius: 60,);
  }

  _email(UserDetailsUiState uiState) {
    return UserEmailWidget(email: uiState.email);
  }

  _name(UserDetailsUiState uiState) {
    return UserFullNameWidget(firstName: uiState.firstName, lastName: uiState.lastName);
  }
}
