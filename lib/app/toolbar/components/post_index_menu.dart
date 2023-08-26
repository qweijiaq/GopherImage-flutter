import 'package:GopherImage/app/components/app_text_menu_item.dart';
import 'package:GopherImage/post/index/post_index_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class PostIndexMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final postIndexStore = context.read<PostIndexStore>();
        final sort = postIndexStore.sort;
        final setSort = postIndexStore.setSort;

        return Row(
          children: [
            AppTextMenuItem(
              label: '最近',
              isActive: sort == 'latest',
              onTap: () => setSort('latest'),
            ),
            SizedBox(width: 24),
            AppTextMenuItem(
              label: '热门',
              isActive: sort == 'most_comments',
              onTap: () => setSort('most_comments'),
            ),
          ],
        );
      },
    );
  }
}
