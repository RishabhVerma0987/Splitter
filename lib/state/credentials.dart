import 'package:flutter/material.dart';

class Credentials with ChangeNotifier {
  String email;
  String password;
  String confirmPassword;

  String emailErrorText;
  String passwordErrorText;
  String emailPasswordMatchErrorText;

  bool emailErrorColor = false;
  bool passwordErrorColor = false;
  bool matchErrorColor = false;

  Credentials({this.email = '', this.password = '', this.confirmPassword});

  getEmail() => email;
  getPassword() => password;

  getEmailErrorText() => emailErrorText;
  getPasswordErrorText() => passwordErrorText;
  getEmailPasswordMatchErrorText() => emailPasswordMatchErrorText;

  getEmailErrorColor() {
    if (emailErrorColor) {
      // return red
      return 0xFFdebdbd;
    } else {
      // return green
      return 0xFFfaf7f7;
    }
  }

  getPasswordErrorColor() {
    if (passwordErrorColor) {
      // return red
      return 0xFFdebdbd;
    } else {
      // return green
      return 0xFFfaf7f7;
    }
  }

  getMatchErrorColor() {
    if (matchErrorColor) {
      // return red
      return 0xFFdebdbd;
    } else {
      // return green
      return 0xFFfaf7f7;
    }
  }

  void checkEmail(String enteredEmail) {
    String arg = validateEmail(enteredEmail);
    if (arg != null) {
      email = '';

      emailErrorText = arg;
      emailErrorColor = true;
    } else {
      email = enteredEmail;

      emailErrorColor = false;
    }
    notifyListeners();
  }

  void checkPassword(String enteredPassword) {
    String arg = validatePassword(enteredPassword);
    if (arg != null) {
      password = '';

      passwordErrorText = arg;
      passwordErrorColor = true;
    } else {
      password = enteredPassword;

      passwordErrorColor = false;
    }
    notifyListeners();
  }

  void checkPasswordMatch(String pass) {
    String arg = 'Password does not match';
    confirmPassword = pass;
    if (confirmPassword == password) {
      matchErrorColor = false;
    } else {
      emailPasswordMatchErrorText = arg;
      matchErrorColor = true;
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
