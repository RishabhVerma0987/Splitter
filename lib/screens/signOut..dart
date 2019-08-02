import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../components/backgroung.dart';
import 'package:provider/provider.dart';
import '../state/credentials.dart';
import '../components/signInSignOutPieces.dart/forum.dart';
import 'package:shimmer/shimmer.dart';
import 'package:avatar_glow/avatar_glow.dart';
import '../components/signInSignOutPieces.dart/displayImage.dart';

String errorText;

class SignOut extends StatefulWidget {
  static String screenId = 'SignUp_screen';
  _SignOutState createState() => _SignOutState();
}

class _SignOutState extends State<SignOut> with TickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  bool error = false;

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
    final credentials = Provider.of<Credentials>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
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
                overflow: Overflow.visible,
                children: <Widget>[
                  BackgroundPaper(
                      height: height, width: width, animation: animation),
                  // ImagePanel(
                  //   imageLoction: 'images/animat-rocket-color.gif',
                  // ),
                  Positioned(
                    top: 40,
                    child: Hero(
                      tag: 'animate',
                      child: Container(
                        child: MainImage(
                            imageLocation: 'images/animat-rocket-color.gif'),
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      EmailErrorBox(error: error),
                      //login
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 100, 0),
                        child: Forum(
                          credentials: credentials,
                          hintText: 'your Email',
                          obscureText: false,
                          color: credentials.getEmailErrorColor(),
                        ),
                      ),
                      //password
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 25, 100, 0),
                        child: Forum(
                          credentials: credentials,
                          hintText: 'password',
                          obscureText: true,
                          color: credentials.getPasswordErrorColor(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 25, 100, 0),
                        child: Forum(
                          credentials: credentials,
                          hintText: 'Confirm password',
                          obscureText: true,
                          id: 1,
                          color: credentials.getMatchErrorColor(),
                        ),
                      ),
                    ],
                  ),
                  signInRow(credentials),
                  SignUpFootnotes(),
                ],
              ));
        },
      ),
    );
  }

  int emailForumColor(bool errorColor) {
    if (errorColor == true) {
      return 0xFFdebdbd;
    } else {
      return 0xFFbddec4;
    }
  }

  Positioned signInRow(Credentials credentials) {
    final double bottomPadding = 110;
    final String text = 'Sign Up';
    final Color textColor = Color(0xFF4C515A);
    final Color circleButtonGlowColor = Colors.blueGrey;
    final Color cirlcleButtonColor = Colors.black54;

    return Positioned(
      left: 30,
      bottom: bottomPadding,
      right: 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(text,
              style: TextStyle(
                fontFamily: 'Raleway Medium',
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: textColor,
              )),
          AvatarGlow(
            startDelay: Duration(milliseconds: 1000),
            glowColor: circleButtonGlowColor,
            endRadius: 70.0,
            duration: Duration(milliseconds: 2000),
            repeat: true,
            showTwoGlows: true,
            repeatPauseDuration: Duration(milliseconds: 100),
            child: Container(
                width: 80.0,
                height: 80.0,
                child: RawMaterialButton(
                  shape: CircleBorder(),
                  elevation: 10,
                  onPressed: () {
                    setState(() {
                      //credentials.checkPasswordMatch();
                      //error = credentials.getError();
                      finalCheck(credentials);
                    });
                  },
                  fillColor: cirlcleButtonColor,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white60,
                  ),
                )),
          ),
        ],
      ),
    );
  }

  void finalCheck(Credentials credentials) {
    if (credentials.emailErrorColor ||
        credentials.passwordErrorColor ||
        credentials.matchErrorColor) {
      error = true;
    } else {
      error = false;
    }
  }
}

class SignUpFootnotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      left: 25,
      right: 25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 70,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                new BoxShadow(
                  color: Colors.black26,
                  offset: new Offset(5.0, 5.0),
                  blurRadius: 7.0,
                )
              ],
            ),
            child: Center(
              child: Shimmer.fromColors(
                baseColor: Colors.white60,
                highlightColor: Colors.white,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('Sign In?',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontFamily: 'NanumGothicCoding Regular',
                        //fontSize: 15
                      )),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 250),
            child: Container(
              child:
                  MainImage(imageLocation: 'images/animat-road-trip-color.gif'),
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
    );
  }
}

class EmailErrorBox extends StatelessWidget {
  EmailErrorBox({
    @required this.error,
  });

  final bool error;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Visibility(
        visible: error,
        child: Container(
          width: 300,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              new BoxShadow(
                color: Colors.black26,
                offset: new Offset(5.0, 5.0),
                blurRadius: 7.0,
              )
            ],
          ),
          child: Center(
              child: Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.black,
            child: Text(
              'credentials wrong',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          )),
        ),
      ),
    );
  }
}
