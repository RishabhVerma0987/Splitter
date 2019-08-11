import 'package:flutter/material.dart';
import 'circularAvatar.dart';

class CardContainer extends StatelessWidget {
  final List<Color> colorForGradient;
  CardContainer({this.colorForGradient});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          gradient: RadialGradient(
              center: Alignment.topRight,
              radius: 1.8,
              colors: colorForGradient)),
      child: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CircluarAvatar(
                  radius: 35,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: RectangleBox(
                  height: 25,
                  width: 70,
                  text: 'Name',
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(left: 15, top: 20),
                    child: RectangleBox(
                      height: 60,
                      width: 100,
                      text: '25.5',
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                    )),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 25),
              child: RectangleBox(
                text: 'Pay',
                height: 50,
                width: 50,
                boxColor: Color(0xFFf05164),
                fontSize: 20,
                fontWeight: FontWeight.w300,
                boxTextColor: Colors.white,
                fontStyle: FontStyle.italic,
              ))
        ],
      ),
    );
  }
}

class RectangleBox extends StatelessWidget {
  final double height;
  final double width;
  final Color boxColor;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color boxTextColor;
  final FontStyle fontStyle;

  RectangleBox({
    @required this.height,
    @required this.width,
    this.boxColor = Colors.white,
    @required this.text,
    @required this.fontSize,
    this.fontWeight = FontWeight.normal,
    this.boxTextColor = Colors.black,
    this.fontStyle = FontStyle.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
              child: Text(text,
                  style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                      color: boxTextColor,
                      fontStyle: fontStyle))),
        ));
  }
}
