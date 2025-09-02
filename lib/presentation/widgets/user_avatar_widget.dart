import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserAvatarWidget extends StatelessWidget {
  final String url;
  final double? radius;

  const UserAvatarWidget({super.key, required this.url , this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(radius: radius, backgroundImage: NetworkImage(url));
  }
}
