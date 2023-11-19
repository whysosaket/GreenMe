import 'package:flutter/material.dart';
import 'package:pro_demo/models/user.dart';

class UserProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  bool get isLoggedIn => _user != null;

  void setUser(User newUser) {
    _user = newUser;
    notifyListeners();
  }
}
