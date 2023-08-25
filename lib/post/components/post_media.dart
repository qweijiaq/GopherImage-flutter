import 'package:flutter/material.dart';

import '../../app/app_config.dart';
import '../post.dart';

class PostMedia extends StatelessWidget {
  final Post post;

  PostMedia({required this.post});

  @override
  Widget build(BuildContext context) {
    final fileId = post.file?.id;
    final imageUrl = '${AppConfig.apiBaseUrl}/files/$fileId/serve?size=medium';

    return Container(
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        // loadingBuilder: (context, child, event) {
        //   if (event == null) return child;

        //   return Container(
        //     color: Colors.black12,
        //   );
        // },
      ),
    );
  }
}
