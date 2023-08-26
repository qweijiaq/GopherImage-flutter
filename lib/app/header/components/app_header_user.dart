import 'package:flutter/material.dart';

import '../../app_config.dart';

class AppHeaderUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Center(
        child: Container(
          width: 32,
          height: 32,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                '${AppConfig.apiBaseUrl}/users/3/avatar?size=medium'),
          ),
        ),
      ),
    );
  }
}
