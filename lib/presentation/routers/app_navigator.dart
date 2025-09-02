import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:tafael_task_tlutter_app/presentation/routers/routes.dart';

class AppNavigator {

  AppNavigator._();

  static void navigateToUserDetail(BuildContext context, int id) {
    GoRouter.of(context).push('/${Routes.userDetails}/$id');
  }



}
