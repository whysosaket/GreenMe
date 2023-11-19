import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pro_demo/models/user.dart';

class UserProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  bool get isLoggedIn => _user != null;

  Future<void> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:9000/api/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'login': username, 'password': password}),
      );

      final Map<String, dynamic> responseData = json.decode(response.body);
      if (responseData['success'] == true) {
        final token = responseData['token'];
        final User newUser = User.fromJson(responseData['data']);
        _user = newUser;
        notifyListeners();
      } else {
        throw Exception(responseData['error']);
      }
    } catch (error) {
      throw Exception('Failed to connect to the server. Please try again.');
    }
  }

  // Add other methods as needed, e.g., logout
}
