import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tafael_task_tlutter_app/extensions/safe_json_access.dart';
import 'package:tafael_task_tlutter_app/presentation/routers/routes.dart';
import '../screens/user_detail_screen.dart';
import '../screens/user_list_screen.dart';




final GoRouter router = GoRouter(
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => const UserListScreen(),
      routes: [

        /*user details route*/
        GoRoute(
          path: '${Routes.userDetails}/:id',
          pageBuilder: (context, state) {
            final id = state.pathParameters.tryInt('id');
            return _pageAnimation(state , UserDetailScreen(userId: id));
          },
        ),
      ],
    ),
  ],
);


CustomTransitionPage _pageAnimation(GoRouterState state, Widget screen) {
  return CustomTransitionPage(
    key: state.pageKey,
    transitionDuration: const Duration(milliseconds: 400), // ⬅️ increase time
    child: screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0), // from right
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  );
}