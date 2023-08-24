import 'package:GopherImage/app/auth/login/components/auth_login_form.dart';
import 'package:flutter/material.dart';

class AuthLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('用户登录'),
      ),
      body: AuthLoginForm(),
    );
  }
}
