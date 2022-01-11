import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_statemanagement/model/user.dart';

class AuthServices{
  String baseUrl = 'https://reqres.in/api';
  Future<User> login({
    String ?email,
    String ?password,
  }) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json; charset=utf-8'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    print(url);
    print(response.statusCode);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      User user = User.fromJson(data);
      // print(data['token']);
      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
}