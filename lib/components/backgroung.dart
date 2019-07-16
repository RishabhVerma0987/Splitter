import 'package:flutter/material.dart';

class BackgroundPaper extends StatelessWidget {
  const BackgroundPaper({
    Key key,
    @required this.height,
    @required this.width,
    @required this.animation,
  }) : super(key: key);

  final double height;
  final double width;
  final Animation animation;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Color(0xFFDFE3ED),
        ),
        Waves(
          left: -(height / 2 - width / 2) * animation.value,
          bottom: (height / 2 - width / 2) * animation.value,
          height: height,
          width: height,
          color: Color(0xFFE6ECF1),
        ),
        Waves(
          height: height / 2 * 1.4,
          width: height / 2 * 1.4,
          color: Color(0xFFF0F4F5),
          left: width / 2 * 0.2 * animation.value,
          bottom: height / 2 * animation.value,
        ),
        Positioned(
          top: -150,
          right: -120,
          child: Container(
            height: height / 2 * animation.value,
            width: height / 2 * animation.value,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blueGrey),
          ),
        ),
        Positioned(
          top: 150,
          right: -30,
          child: Container(
            height: 100,
            width: 100,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.black54),
          ),
        ),
      ],
    );
  }
}

class Waves extends StatelessWidget {
  Waves(
      {this.left, this.bottom, this.height, this.top, this.width, this.color});

  final double left;
  final double bottom;
  final double height;
  final double width;
  final double top;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      bottom: bottom,
      child: Container(
        width: height,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}

// Waves(
//           height: height / 2 * 0.8,
//           width: height / 2 * 0.8,
//           color: Color(0xFFF8FBFA),
//           left: width / 2 + animation.value * 45,
//           bottom: (height / 2 + width / 2 * animation.value),
//         ),
