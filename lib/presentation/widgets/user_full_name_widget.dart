import 'package:flutter/cupertino.dart';

class UserFullNameWidget extends StatelessWidget {

  final String firstName;
  final String lastName;
  final TextStyle? style;

  const UserFullNameWidget({
    super.key,
    required this.firstName,
    required this.lastName,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$firstName $lastName',
      style: style ?? const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
