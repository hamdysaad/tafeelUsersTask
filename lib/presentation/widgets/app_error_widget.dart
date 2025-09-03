import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {

  final String message;

  const AppErrorWidget(this.message , {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(message , style: TextStyle(color: Colors.red),);
  }
}
