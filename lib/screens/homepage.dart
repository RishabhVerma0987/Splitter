import 'dart:ui';
import 'package:flutter/material.dart';
import '../components/homepage/swipingcard.dart';
import '../components/homepage/circularAvatar.dart';

class Homepage extends StatefulWidget {
  static String homePageId = 'Home_Page_screen';
  Homepage({Key key}) : super(key: key);

  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final width = constraints.maxWidth;
      final height = constraints.maxHeight;
      return Scaffold(
        body: Column(
          children: <Widget>[
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    color: Color(0xFF7C87D5),
                    width: width,
                    height: height / 2.6,
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 20,
                  child: Icon(
                    Icons.list,
                    color: Colors.black,
                    size: 40,
                  ),
                ),
                Positioned(
                    left: width / 2 - 60,
                    top: 185,
                    child: CircluarAvatar(
                      radius: 60,
                    )),
                Positioned(
                  top: 70,
                  left: width / 2 - 34,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Total',
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                      Text(
                        '23.4',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                ),
                CircleForDash(
                  top: 120,
                  left: 40,
                  right: null,
                  text: '50.0',
                  color: Color(0xFFeb7373),
                ),
                CircleForDash(
                  top: 120,
                  left: null,
                  right: 40,
                  text: '50.0',
                  color: Color(0xFF73ebc5),
                ),
                Positioned(
                  left: width / 2 - 60,
                  top: 310,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sarah',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'What a lovely day !!',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w200),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.mood,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 90, right: 190),
              child: OwesOrOwedText(
                text: 'You Owe',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: SwipingCard(),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20, left: 200),
                child: OwesOrOwedText(
                  text: 'You are Owed',
                )),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: SwipingCard(),
            ),
          ],
        ),
      );
    });
  }
}

class OwesOrOwedText extends StatelessWidget {
  final String text;
  OwesOrOwedText({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.italic),
    );
  }
}

class CircleForDash extends StatelessWidget {
  final double top;
  final double left;
  final String text;
  final double right;
  final Color color;

  CircleForDash({
    this.left,
    this.top,
    this.right,
    this.text,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: top,
        left: left,
        right: right,
        child: Container(
          width: 100,
          height: 100,
          child: Material(
            shape: CircleBorder(),
            color: color,
            child: Center(child: Text(text)),
          ),
        ));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height);
    final arcControlPoint = Offset(size.width / 2, size.height - 70);
    final arcEnd = Offset(size.width, size.height);

    path.quadraticBezierTo(
        arcControlPoint.dx, arcControlPoint.dy, arcEnd.dx, arcEnd.dy);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
