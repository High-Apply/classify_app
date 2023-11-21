import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String _id = '';
  String _password = '';

  String get id => _id;
  String get password => _password;

  void setId(String val) {
    _id = val;
    notifyListeners();
  }

  void setPassword(String val) {
    _password = val;
    notifyListeners();
  }
}