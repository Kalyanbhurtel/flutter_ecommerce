import 'dart:convert';

import 'package:ecomm/model/login_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;


class LoginController {
  final storage = FlutterSecureStorage();
  static const String apiUrl = 'http://192.168.18.3:8000/api/auth/login/';

  Future<bool> loginUser(String email, String password) async {
    try {
      Map<String, String> requestBody = {
        'email': email,
        'password': password,
      };

      final response = await http.post(Uri.parse(apiUrl),
          body: json.encode(requestBody),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        final loginModel = LoginModel.fromJson(json.decode(response.body));
        
        // Save the token to secure storage
        await storage.write(key: 'token', value: loginModel.data?.jwtToken ?? '');

        return true; // Login successful
      } else {
        throw Exception('Failed to login: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Exception during login: $e');
      }
      return false; // Login failed
    }
  }

  Future<void> logoutUser() async {
    try {
      // Clear the token from secure storage
      await storage.delete(key: 'token');
    } catch (e) {
      if (kDebugMode) {
        print('Exception during logout: $e');
      }
    }
  }
}
