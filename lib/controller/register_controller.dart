import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class RegisterController {
  final String apiUrl = 'http://192.168.18.3:8000/api/auth/register/';

  Future<bool> registerConsumer({
     required String role,
  required String name,
  required String phone,
  required String email,
  required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode({
           'role': role,
        'name': name,
        'phone': phone,
        'email': email,
        'password': password,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 201) {
        // Registration successful
        return true;
      } else {
        // Registration failed
        if (kDebugMode) {
          print('Failed to register consumer: ${response.statusCode}');
        }
        return false;
      }
    } catch (e) {
      // Exception occurred
      if (kDebugMode) {
        print('Exception during consumer registration: $e');
      }
      return false;
    }
  }

  Future<bool> registerWholesaler({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String companyName,
    required String companyPhone,
    required String companyEmail,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode({
          'role': 'wholesaler',
          'name': name,
          'phone': phone,
          'email': email,
          'password': password,
          'company_name': companyName,
          'company_phone': companyPhone,
          'company_email': companyEmail,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 201) {
        // Registration successful
        return true;
      } else {
        // Registration failed
        if (kDebugMode) {
          print('Failed to register wholesaler: ${response.statusCode}');
        }
        return false;
      }
    } catch (e) {
      // Exception occurred
      if (kDebugMode) {
        print('Exception during wholesaler registration: $e');
      }
      return false;
    }
  }
}
