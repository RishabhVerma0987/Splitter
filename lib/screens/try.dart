import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../components/backgroung.dart';
import 'package:provider/provider.dart';
import '../state/credentials.dart';
import '../components/forum.dart';
import 'package:shimmer/shimmer.dart';
import 'package:avatar_glow/avatar_glow.dart';

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
                ImagePanel(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          )),
                        ),
                      ),
                    ),
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
                Positioned(
                  left: 30,
                  bottom: 110,
                  right: 15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Sign In',
                        style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4C515A)),
                      ),
                      AvatarGlow(
                        startDelay: Duration(milliseconds: 1000),
                        glowColor: Colors.blueGrey,
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
                              onPressed: () {},
                              fillColor: Colors.black54,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white54,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                Positioned(
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
                                )),
                          ),
                        ),
                      ),
                      Text('forget password ?',
                          style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              decoration: TextDecoration.underline)),
                    ],
                  ),
                )
              ],
            ));
      },
    );
  }
}

// RaisedButton(
//                       child: Text("Login"),
//                       onPressed: () {
//                         setState(() {
//                           error = credentials.getError();
//                         });
//                       },
//                     )

class ImagePanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/animat-road-trip-color.gif');
    Image image = Image(
      image: assetImage,
    );

    return Positioned(
      top: 40,
      child: Container(
        child: image,
        width: 200,
        height: 200,
      ),
    );
  }
}
