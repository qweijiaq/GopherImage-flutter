import 'package:flutter/material.dart';

class AppFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.share_outlined),
      onPressed: () {
        print('share');
      },
      backgroundColor: Colors.black87,
      foregroundColor: Colors.white70,
    );
  }
}
