import 'package:flutter/material.dart';

class AppEmptyWidget extends StatelessWidget {

  final String message;

  const AppEmptyWidget(this.message , {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(message);
  }
}
