import 'package:GopherImage/app/auth/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthModel>(
      builder: (context, value, child) {
        return Container(
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: value.isLoggedIn ? Text(value.name) : Text('未登录'),
          ),
        );
      },
    );
  }
}
