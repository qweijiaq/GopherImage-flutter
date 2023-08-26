import 'package:GopherImage/post/index/components/post_list_item.dart';
import 'package:flutter/material.dart';
import '../../post.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PostGridList extends StatelessWidget {
  final List<Post> posts;

  PostGridList({
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(8),
      sliver: SliverStaggeredGrid.countBuilder(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostListItem(
            item: posts[index],
            layout: PostListLayout.grid,
          );
        },
        staggeredTileBuilder: (index) {
          final Post post = posts[index];
          int crossAxisCount = 1;
          double mainAxisCount = 1;
          bool isPortrait = false;

          if (post.file!.width != null && post.file!.height != null) {
            isPortrait = post.file!.width! < post.file!.height!;
          }

          if (isPortrait) {
            mainAxisCount = 1.5;
          }

          return StaggeredTile.count(crossAxisCount, mainAxisCount);
        },
      ),
    );
  }
}
