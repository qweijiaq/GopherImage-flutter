import 'package:flutter/material.dart';

class AppMoveToTop extends StatelessWidget {
  final ScrollController scrollController;

  AppMoveToTop(this.scrollController);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: TextButton(
          child: Text('回到顶部'),
          onPressed: () {
            scrollController.position
                .moveTo(scrollController.position.minScrollExtent);
          },
        ),
      ),
    );
  }
}
