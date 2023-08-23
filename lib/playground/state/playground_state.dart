import 'package:GopherImage/app/auth/login/auth_login.dart';
import 'package:flutter/material.dart';

class PlaygroundState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: double.infinity,
      child: AuthLogin(),
    );
  }
}
