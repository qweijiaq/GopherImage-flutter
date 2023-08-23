import 'package:GopherImage/user/create/user_create.dart';
import 'package:flutter/material.dart';

class PlaygroundInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(32),
      width: double.infinity,
      child: UserCreate(),
    );
  }
}
