import 'package:flutter/material.dart';

class CircluarAvatar extends StatelessWidget {
  final double radius;
  const CircluarAvatar({this.radius});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      shape: CircleBorder(),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.cyan,
        backgroundImage: NetworkImage(
            'https://qodebrisbane.com/wp-content/uploads/2019/02/This-is-not-a-person-10-1.jpeg'),
      ),
    );
  }
}
