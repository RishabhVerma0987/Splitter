import 'package:flutter/material.dart';

class Credentials with ChangeNotifier {
  String email;
  String password;
  bool error;

  Credentials({this.email = '', this.password = '', this.error = false});

  getEmail() => email;
  getPassword() => password;
  getError() => error;

  void checkEmail(String enteredEmail) {
    if (validateEmail(enteredEmail) != null) {
      email = '';
      error = true;
    } else {
      email = enteredEmail;
      error = false;
    }
    notifyListeners();
  }

  void checkPassword(String enteredPassword) {
    if (validatePassword(enteredPassword) != null) {
      password = '';
      error = true;
    } else {
      password = enteredPassword;
      error = false;
    }
    notifyListeners();
  }

  String validatePassword(String value) {
    Pattern pattern = r'^(?=.*\d).{4,8}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value))
      return 'Password must be between 4 and 8 digits long and include at least one numeric digit.';
    else {
      return null;
    }
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter valid email';
    else
      return null;
  }
}
