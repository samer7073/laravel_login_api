import 'package:flutter_application_api_larvel/models/loginSucces.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginApi {
  Future<LoginSuccess> loginUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // If the server returned a 200 OK response, parse the JSON response
      // and return the Register object.
      return LoginSuccess.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else if (response.statusCode == 400) {
      // If the server returned a 400 BAD REQUEST response, throw a specific exception
      // with a more descriptive error message.
      throw Exception('Bad request: ${response.body}');
    } else {
      // For any other status code, throw a generic exception with the status code
      // and response body.
      throw Exception(
          'Failed with status code: ${response.statusCode}. Response: ${response.body}');
    }
  }
}
