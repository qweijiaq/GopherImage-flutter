import 'package:GopherImage/app/auth/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthLoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authModel = Provider.of<AuthModel>(context);

    final loginButton = ElevatedButton(
      child: Text('登录'),
      onPressed: () {
        print('已登录: ${authModel.isLoggedIn}');
        authModel.login();
        print('已登录: ${authModel.isLoggedIn}');
      },
    );

    final logoutButton = ElevatedButton(
      child: Text('退出登录'),
      onPressed: () {
        print('已登录: ${authModel.isLoggedIn}');
        authModel.logout();
        print('已登录: ${authModel.isLoggedIn}');
      },
    );

    return Container(
      child: authModel.isLoggedIn ? logoutButton : loginButton,
    );
  }
}
