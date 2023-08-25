import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import '../../app_config.dart';
import '../../app_service.dart';

class DiggCreateModel extends ChangeNotifier {
  final AppService appService;

  DiggCreateModel({
    required this.appService,
  });

  createUserDiggPost(int postId) async {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/posts/$postId/digg');
    final response = await appService.apiHttpClient.post(uri);
    final responseBody = jsonDecode(response.body);

    if (response.statusCode == 201) {
      notifyListeners();
    } else {
      throw HttpException(responseBody['message']);
    }
  }
}
