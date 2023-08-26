import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../app/app_config.dart';

class UserCreateModel extends ChangeNotifier {
  Future<int> createUser({
    required String name,
    required String password,
  }) async {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/users');

    final response = await http.post(
      uri,
      headers: {"content-type": "application/json"},
      body: jsonEncode({
        'name': name,
        'password': password,
      }),
    );

    final responseBody = jsonDecode(response.body);

    if (response.statusCode == 201) {
      notifyListeners();

      return responseBody['insertId'];
    } else {
      throw HttpException(responseBody['message']);
    }
  }
}
