import 'package:flutter/material.dart';

class CircluarAvatar extends StatelessWidget {
  final double radius;
  final ImageProvider image;
  const CircluarAvatar({ @required this.radius,@required this.image});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      shape: CircleBorder(),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.cyan,
        backgroundImage: image,
      ),
    );
  }
}
