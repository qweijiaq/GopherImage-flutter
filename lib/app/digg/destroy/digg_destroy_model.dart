import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import '../../app_config.dart';
import '../../app_service.dart';

class DiggDestroyModel extends ChangeNotifier {
  final AppService appService;

  DiggDestroyModel({
    required this.appService,
  });

  deleteUserDiggPost(int postId) async {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/posts/$postId/digg');
    final response = await appService.apiHttpClient.delete(uri);
    final responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      notifyListeners();
    } else {
      throw HttpException(responseBody['message']);
    }
  }
}
