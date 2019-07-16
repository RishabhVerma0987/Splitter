import 'package:flutter/material.dart';
import '../../state/credentials.dart';

class Forum extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Credentials credentials;
  final int color;
  final int id;
  Forum(
      {@required this.hintText,
      this.obscureText,
      @required this.credentials,
      this.id = 0,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(color),
      //color: Color(0xFFbddec4),
      //color: Color(0xFFdebdbd),
      elevation: 9,
      shape: StadiumBorder(),
      child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 2, 0, 2),
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Raleway Medium',
                )),
            keyboardType: TextInputType.emailAddress,
            obscureText: obscureText,
            onChanged: (input) {
              // In login, we will not consider the validity of password
              if (id != 1) {
                if (obscureText) {
                  //credentials.password = input;
                  credentials.checkPassword(input);
                } else {
                  credentials.checkEmail(input);
                }
              } else {
                //credentials.confirmPassword = input;
                credentials.checkPasswordMatch(input);
              }
            },
          )),
    );
  }
}
