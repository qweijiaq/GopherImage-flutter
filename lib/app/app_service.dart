import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_config.dart';
import 'auth/auth_model.dart';

class ApiHttpClient extends http.BaseClient {
  final String token;

  ApiHttpClient({
    required this.token,
  });

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (token.isNotEmpty) {
      request.headers.putIfAbsent('Authorization', () => 'Bearer $token');
    }

    return request.send();
  }

  Future<http.StreamedResponse> uploadImage({
    required PlatformFile file,
    required int postId,
  }) async {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/files?post=$postId');
    final request = http.MultipartRequest('POST', uri);
    request.headers.putIfAbsent('Authorization', () => 'Bearer $token');

    final multipartFile = await http.MultipartFile.fromPath(
      'file',
      file.path!,
      contentType: MediaType('image', file.extension ?? 'jpg'),
    );

    request.files.add(multipartFile);

    return request.send();
  }
}

class AppService extends ChangeNotifier {
  final AuthModel authModel;
  late ApiHttpClient apiHttpClient;

  AppService({
    required this.authModel,
  }) {
    apiHttpClient = ApiHttpClient(token: authModel.token);
  }
}

class AppStorage {
  static Future<bool> setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  static Future<bool> setObject(String key, Object value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, jsonEncode(value));
  }

  static Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  static Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<Map<String, dynamic>?> getMap(String key) async {
    Map<String, dynamic>? data;
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getString(key);

    if (result != null) {
      data = jsonDecode(result);
    }

    return data;
  }
}
