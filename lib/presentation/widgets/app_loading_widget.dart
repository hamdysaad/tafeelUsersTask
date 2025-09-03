import 'package:flutter/material.dart';

class AppLoadingWidget extends StatelessWidget{
  const AppLoadingWidget({super.key});


  @override
  Widget build(BuildContext context) {
   return Column(
     mainAxisSize: MainAxisSize.min,
     children: [
       CircularProgressIndicator(),
     ],
   );
  }

}
