import 'dart:convert';

import 'package:flutter/material.dart';
import '../../app/app_config.dart';
import '../../app/app_service.dart';
import '../post.dart';

class PostIndexModel extends ChangeNotifier {
  List<Post>? posts;
  final AppService appService;

  PostIndexModel({
    required this.appService,
    this.posts,
  });

  List<Post> parsePosts(responseBody) {
    final List<Post> parsed = jsonDecode(responseBody)
        .map<Post>((item) => Post.fromJson(item))
        .toList();

    return parsed;
  }

  Future<List<Post>> getPosts() async {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/posts');
    final response = await appService.apiHttpClient.get(uri);
    final parsed = parsePosts(response.body);
    posts = parsed;
    notifyListeners();

    return parsed;
  }
}
