import 'dart:convert';
import 'dart:io';

import 'package:GopherImage/app/app_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../app_config.dart';
import 'auth.dart';

class AuthModel extends ChangeNotifier {
  String userId = '';
  String name = '';
  String token = '';
  bool get isLoggedIn => token.isNotEmpty;

  setAuth(Auth auth) {
    userId = '${auth.id}';
    name = auth.name;
    token = auth.token;

    notifyListeners();
  }

  storeAuth(Auth auth) async {
    AppStorage.setObject('auth', auth);
  }

  removeAuth() async {
    AppStorage.remove('auth');
  }

  Future<Auth> login(LoginData data) async {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/login');
    final response = await http.post(
      uri,
      headers: {"content-type": "application/json"},
      body: jsonEncode(data.toJson()),
    );
    final responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      final auth = Auth.fromJson(responseBody);

      userId = auth.id.toString();
      name = auth.name;
      token = auth.token;

      storeAuth(auth);

      notifyListeners();

      return auth;
    } else {
      throw HttpException(responseBody['message'] ?? '网络请求出了点问题 🌋');
    }
  }

  logout() {
    userId = '';
    name = '';
    token = '';

    removeAuth();

    notifyListeners();
  }
}
