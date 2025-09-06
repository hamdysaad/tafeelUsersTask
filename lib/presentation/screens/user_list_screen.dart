import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tafael_task_tlutter_app/presentation/routers/app_navigator.dart';
import 'package:tafael_task_tlutter_app/presentation/ui_states/user_item_ui_state.dart';
import 'package:tafael_task_tlutter_app/presentation/widgets/app_empty_widget.dart';
import 'package:tafael_task_tlutter_app/presentation/widgets/app_error_widget.dart';
import 'package:tafael_task_tlutter_app/presentation/widgets/app_loading_widget.dart';

import '../providers/user_list_provider.dart';
import '../states/users_list_state.dart';
import '../widgets/user_item_widget.dart';


class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});
  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    // load initial if not already loaded
    final provider = context.read<UserListProvider>();
     provider.initLoadUsers();

    _controller.addListener(() {
      var state = provider.state;
      if(state is UsersListStateSuccess){
        var isLoadingMore = _controller.position.pixels >= _controller.position.maxScrollExtent - 150 &&
            !state.isLoadingMore &&
            state.hasNextPage;
          if(isLoadingMore){
            provider.loadMore();
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users'), centerTitle: true,),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Consumer<UserListProvider>(
          builder: (context, prov, _) {
            var state = prov.state;
            switch(state){
              case UsersListStateLoading(): return _loading();
              case UsersListStateSuccess(): return _success(state , prov);
              case UsersListStateError(): return _error(state);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _loading() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: AppLoadingWidget(),
    );
  }

  Widget _success(UsersListStateSuccess state, UserListProvider prov) {

    /*check if empty list*/
    var uiStates = state.uiState;
    if(uiStates.isEmpty) return _emptyView();

    return ListView.builder(
      controller: _controller,
      itemCount: uiStates.length +( state.isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if(index == uiStates.length && state.isLoadingMore) {
          return _loading();
        }
        var uiState = uiStates[index];
        return UserItemWidget(uiState: uiState, onItemClick: onUserItemClick,);
      },
    );
  }

  Widget _error(UsersListStateError state) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: AppErrorWidget('Error: ${state.exception}'),
    );
  }

  Widget _emptyView() {
    return const Center(child: AppEmptyWidget('No users found'));
  }

  onUserItemClick(UserItemUiState uiState) {
    AppNavigator.navigateToUserDetail(context, uiState.id);
  }
}

