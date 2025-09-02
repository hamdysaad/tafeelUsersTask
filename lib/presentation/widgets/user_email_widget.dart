
import 'package:flutter/cupertino.dart';

class UserEmailWidget extends StatelessWidget {

  final String email;

  const UserEmailWidget({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Text(email);
  }
}
