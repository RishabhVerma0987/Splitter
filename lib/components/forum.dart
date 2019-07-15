import 'package:flutter/material.dart';
import '../state/credentials.dart';

class Forum extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Credentials credentials;
  Forum({
    @required this.hintText,
    this.obscureText,
    @required this.credentials,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFF8FBFA),
      elevation: 9,
      shape: StadiumBorder(),
      child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 2, 0, 2),
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w300, fontStyle: FontStyle.italic)),
            keyboardType: TextInputType.emailAddress,
            obscureText: obscureText,
            onChanged: (input) {
              // In login, we will not consider the validity of password

              if (obscureText) {
                credentials.password = input;
              } else {
                credentials.checkEmail(input);
              }
            },
          )),
    );
  }
}
