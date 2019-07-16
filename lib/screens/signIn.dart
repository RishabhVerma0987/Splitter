import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../components/backgroung.dart';
import 'package:provider/provider.dart';
import '../state/credentials.dart';
import '../components/signInSignOutPieces.dart/forum.dart';
import 'package:shimmer/shimmer.dart';
import 'package:avatar_glow/avatar_glow.dart';
import '../components/signInSignOutPieces.dart/frontImage.dart';

class SignIn extends StatefulWidget {
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with TickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  bool error = false;

  void initState() {
    super.initState();
    backAni();
    print("from try");
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
              overflow: Overflow.visible,
              children: <Widget>[
                BackgroundPaper(
                    height: height, width: width, animation: animation),
                ImagePanel(
                  imageLoction: 'images/animat-road-trip-color.gif',
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
                        hintText: 'login',
                        obscureText: false,
                      ),
                    ),
                    //password
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 25, 100, 0),
                      child: Forum(
                        credentials: credentials,
                        hintText: 'password',
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
                signInRow(credentials),
                SignUpFootnotes(),
              ],
            ));
      },
    );
  }

  Positioned signInRow(Credentials credentials) {
    final double bottomPadding = 110;
    final String text = 'Sign In';
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
                      error = credentials.getError();
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
                child: Text('Sign Up?',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontFamily: 'NanumGothicCoding Regular')),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 160),
            child: ImagePanelTwo(
              imageLoction: 'images/animat-rocket-color.gif',
            ),
          ),
          Text('forget password ?',
              style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'NanumGothicCoding Regular',
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline)),
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
              'Email or password is invalid',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          )),
        ),
      ),
    );
  }
}
