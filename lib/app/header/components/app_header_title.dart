import 'package:GopherImage/post/index/post_index_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class AppHeaderTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      final postIndexStore = context.read<PostIndexStore>();
      final text = Text(
        '发现',
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      );

      final showIndicator = postIndexStore.loading;

      final indicator = Container(
        padding: EdgeInsets.all(8),
        width: 24,
        height: 24,
        child: showIndicator
            ? CircularProgressIndicator(
                strokeWidth: 2,
              )
            : Container(),
      );

      final title = Container(
        padding: EdgeInsets.only(left: 8),
        child: GestureDetector(
          child: Row(
            children: [
              text,
              indicator,
            ],
          ),
        ),
      );

      return Row(
        children: [
          title,
        ],
      );
    });
  }
}
