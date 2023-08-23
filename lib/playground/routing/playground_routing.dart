import 'package:GopherImage/app/app_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlaygroundRouting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context);

    return Container(
      color: Colors.white,
      child: Center(
        child: TextButton(
          child: Text('查看内容'),
          onPressed: () {
            appModel.setPageName('About');
          },
        ),
      ),
    );
  }
}
