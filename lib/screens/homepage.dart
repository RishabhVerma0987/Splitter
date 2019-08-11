import 'dart:ui';
import 'dart:ui' as prefix0;
import 'package:flutter/material.dart';
import '../components/homepage/swipingcard.dart';
import '../components/homepage/circularAvatar.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
                    height: height / 2.9,
                  ),
                ),
                Positioned(
                    left: width / 2 - 50,
                    top: 165,
                    child: CircluarAvatar(
                      radius: 50,
                      image: NetworkImage(
                          'https://cdn.pixabay.com/photo/2014/07/09/10/04/man-388104_960_720.jpg'),
                    )),
                Positioned(
                  top: 60,
                  left: width / 2 - 45,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Total',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        '123.4',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
                CircleWithIndicator(
                  text: '70.0',
                  backgroundColor: Colors.redAccent,
                  progressColor: Colors.greenAccent,
                  textColor: Colors.white,
                  totalOweAmount: '100',
                  currency: 'dollar',
                ),
                Padding(
                    padding: EdgeInsets.only(left: 240),
                    child: CircleWithIndicator(
                      text: '50.0',
                      backgroundColor: Colors.greenAccent,
                      progressColor: Colors.redAccent,
                      textColor: Colors.black,
                      totalOweAmount: '300',
                      currency: 'ruppe',
                    )),
                Positioned(
                  left: width / 2 - 65,
                  top: 270,
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
              padding: const EdgeInsets.only(top: 75, right: 210),
              child: OwesOrOwedText(
                text: 'You Owe',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: SwipingCard(
                isOwe: true,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20, left: 200),
                child: OwesOrOwedText(
                  text: 'You are Owed',
                )),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: SwipingCard(
                isOwe: false,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class CircleWithIndicator extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color progressColor;
  final Color textColor;
  final String totalOweAmount;
  final String currency;
  CircleWithIndicator(
      {this.text,
      this.backgroundColor,
      this.progressColor,
      this.textColor,
      this.totalOweAmount,
      this.currency});

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        CircleForDash(
          top: 100,
          left: 40,
          right: null,
          text: text,
          color: backgroundColor,
          textColor: textColor,
          totalOweAmount: totalOweAmount,
          currency: currency,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 90, left: 34),
          child: CircularPercentIndicator(
            radius: 110.0,
            lineWidth: 7.0,
            animation: true,
            percent: 0.7,
            reverse: true,
            backgroundColor: backgroundColor,
            center: new Text(
              "",
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: progressColor,
          ),
        ),
      ],
    );
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
  final Color textColor;
  final String totalOweAmount;
  final String currency;

  CircleForDash({
    this.left,
    this.top,
    this.right,
    this.text,
    this.color,
    this.textColor,
    this.totalOweAmount,
    this.currency,
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
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 25,
                    fontWeight: prefix0.FontWeight.normal,
                  ),
                ),
                Text(
                  'left out of $totalOweAmount' +
                      '\n' +
                      '\t\t\t\t' +
                      '$currency',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                      color: textColor),
                )
              ],
            )),
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
