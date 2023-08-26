import 'package:flutter/material.dart';

class AppHeaderSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Icon(
        Icons.search_outlined,
      ),
    );
  }
}
