import 'dart:convert';
import 'dart:io';

import 'package:GopherImage/user/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../app/app_config.dart';

class PlaygroundHttp extends StatefulWidget {
  @override
  State<PlaygroundHttp> createState() => _PlaygroundHttpState();
}

class _PlaygroundHttpState extends State<PlaygroundHttp> {
  String? currentUserName;

  String? currentUserToken;

  getUser() async {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/users/248');
    final response = await http.get(uri);

    print('状态码 ${response.statusCode}');
    print('响应主体 ${response.body}');

    if (response.statusCode == 200) {
      final user = User.fromJson(response.body);
      print('${user.id}, ${user.name}');
    }
  }

  createUser() async {
    final name = '佩奇';
    final password = '123123';

    final uri = Uri.parse('http://127.0.0.1:3000/users');

    final response = await http.post(uri,
        headers: {"content-type": "application/json"},
        body: jsonEncode(<String, String>{
          'name': name,
          'password': password,
        }));

    print('状态码 ${response.statusCode}');
    print('响应主体 ${response.body}');
  }

  login() async {
    final name = '佩奇';
    final password = '123123';

    final uri = Uri.parse('http://127.0.0.1:3000/login');

    final response = await http.post(uri,
        headers: {"content-type": "application/json"},
        body: jsonEncode(<String, String>{
          'name': name,
          'password': password,
        }));

    print('状态码 ${response.statusCode}');
    print('响应主体 ${response.body}');

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      setState(() {
        currentUserName = responseBody['name'];
        currentUserToken = responseBody['token'];
      });
    }
  }

  updateUser() async {
    final name = '小猪佩奇';
    final password = '123123';

    final uri = Uri.parse('http://127.0.0.1:3000/users');

    final headers = {
      'Authorization': 'Bearer $currentUserToken',
      HttpHeaders.contentTypeHeader: 'application/json'
    };

    final body = jsonEncode({
      'validate': {
        'password': password,
      },
      'update': {
        'name': name,
      }
    });

    final response = await http.patch(
      uri,
      headers: headers,
      body: body,
    );

    print('状态码 ${response.statusCode}');
    print('响应主体 ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentUserName ?? '未登录',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          ElevatedButton(
            child: Text('发送请求'),
            onPressed: getUser,
          ),
          ElevatedButton(
            child: Text('创建用户'),
            onPressed: createUser,
          ),
          ElevatedButton(
            child: Text('用户登录'),
            onPressed: login,
          ),
          ElevatedButton(
            child: Text('更新用户'),
            onPressed: updateUser,
          ),
        ],
      ),
    );
  }
}
