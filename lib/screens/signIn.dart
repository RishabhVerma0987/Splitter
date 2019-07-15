import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../components/backgroung.dart';

class SignIn extends StatefulWidget {
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with TickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  bool error = false;
  String email;
  String password;

  void initState() {
    super.initState();
    backAni();
  }

  void backAni() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      lowerBound: 0.25,
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.elasticOut);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    print(error);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final height = constraints.maxHeight;
        final width = constraints.maxWidth;
        return GestureDetector(
            onTap: () {
              setState(() {
                backAni();
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                BackgroundPaper(
                    height: height, width: width, animation: animation),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 100, 0),
                      child: Material(
                        color: Color(0xFFF8FBFA),
                        elevation: 9,
                        shape: StadiumBorder(),
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 2, 0, 2),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'login',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.italic)),
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (input) {
                                setState(() {
                                  email = input;
                                });
                              },
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ));
      },
    );
  }

  //FIXME: FIND A DIFFERENT WAY TO STORE THIS IN ANOTHER FILE
  void checkEmail() {
    if (validateEmail(email) != null) {
      setState(() {
        email = '';
        error = true;
      });
      print('error');
    } else {
      print('not error');
      setState(() {
        error = false;
      });
    }
  }

  //FIXME: different folder
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'enter valid email';
    else
      return null;
  }
}

// Material(
//                       color: Colors.white,
//                       elevation: 3,
//                       shape: StadiumBorder(),
//                       child: Padding(
//                           padding: const EdgeInsets.only(left: 8.0),
//                           child: TextField(
//                             decoration: InputDecoration(
//                                 border: InputBorder.none, hintText: 'Password'),
//                             onChanged: (input) {
//                               setState(() {
//                                 password = input;
//                               });
//                             },
//                             obscureText: true,
//                           )),
//                     ),

// RaisedButton(
//                       child: Text("Login"),
//                       onPressed: () {
//                         checkEmail();
//                       },
//                     )

// Visibility(
//                       visible: error,
//                       child: Container(
//                         child: Text('Email invalid'),
//                       ),
//                     ),
