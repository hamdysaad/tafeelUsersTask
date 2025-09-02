import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tafael_task_tlutter_app/di/di_injections.dart';
import 'package:tafael_task_tlutter_app/domain/usecases/get_users_list_use_case.dart';
import 'package:tafael_task_tlutter_app/presentation/providers/user_list_provider.dart';
import 'presentation/routers/routers.dart';
import 'presentation/screens/user_list_screen.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await DiInjections.init(); // register dependencies
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provide the UserListProvider at root (could be scoped to route instead)
        ChangeNotifierProvider(
          // create: (_) => UserListProvider(sl<GetUsersListUseCase>())..initLoadUsers(),
          create: (_) => UserListProvider(sl<GetUsersListUseCase>()),
        ),
      ],

      child:   MaterialApp.router(
        routerConfig: router,
        theme: ThemeData(primarySwatch: Colors.blue),
      ),
      // child: MaterialApp(
      //   debugShowCheckedModeBanner: false,
      //   title: 'Users',
      //   theme: ThemeData(primarySwatch: Colors.blue),
      //   home: const UserListScreen(),
      // ),
    );
  }
}