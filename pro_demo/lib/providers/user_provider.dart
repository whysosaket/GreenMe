import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pro_demo/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  User? _user;
  late String _token;

  User? get user => _user;
  bool get isLoggedIn => _user != null;
  String get token => _token;

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
        _token = responseData['token'];
        final User newUser = User.fromJson(responseData['data']);
        _user = newUser;
        _saveDataToLocal(_token, responseData['data']);
        notifyListeners();
      } else {
        throw Exception(responseData['error']);
      }
    } catch (error) {
      throw Exception('Failed to connect to the server. Please try again.');
    }
  }

  void logout() async {
    _user = null;
    _token = '';
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('user');
    notifyListeners();
  }

  void _saveDataToLocal(String token, Map<String, dynamic> data) async {
    print(data);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('user', jsonEncode(data));
  }

  void setUser(User newUser) {
    _user = newUser;
  }

  // Add other methods as needed, e.g., logout
}
