import 'dart:math';

import 'package:flutter/material.dart';

List<List<Color>> colorGradientForSwipingCards = [
  [
    Colors.orange[800],
    Colors.orange[700],
    Colors.orange[600],
    Colors.orange[500],
    Colors.orange[400],
    Colors.orange[300],
  ],
  [
    Colors.lightBlue[800],
    Colors.lightBlue[700],
    Colors.lightBlue[600],
    Colors.lightBlue[500],
    Colors.lightBlue[400],
    Colors.lightBlue[300],
  ],
  [
    Colors.lightGreen[800],
    Colors.lightGreen[700],
    Colors.lightGreen[600],
    Colors.lightGreen[500],
    Colors.lightGreen[400],
    Colors.lightGreen[300],
  ],
  [
    Colors.pink[800],
    Colors.pink[700],
    Colors.pink[600],
    Colors.pink[500],
    Colors.pink[400],
    Colors.pink[300],
  ],
  [
    Colors.teal[800],
    Colors.teal[700],
    Colors.teal[600],
    Colors.teal[500],
    Colors.teal[400],
    Colors.teal[300],
  ],
  [
    Colors.yellow[800],
    Colors.yellow[700],
    Colors.yellow[600],
    Colors.yellow[500],
    Colors.yellow[400],
    Colors.yellow[300],
  ],
  [
    Colors.purple[800],
    Colors.purple[700],
    Colors.purple[600],
    Colors.purple[500],
    Colors.purple[400],
    Colors.purple[300],
  ],
  [
    Colors.brown[800],
    Colors.brown[700],
    Colors.brown[600],
    Colors.brown[500],
    Colors.brown[400],
    Colors.brown[300],
  ],
  [
    Colors.redAccent[800],
    Colors.redAccent[700],
    Colors.redAccent[600],
    Colors.redAccent[500],
    Colors.redAccent[400],
    Colors.redAccent[300],
  ],
];

List<Color> pickRandomColorList() {
  var rng = new Random();
  var number = rng.nextInt(colorGradientForSwipingCards.length);
  return colorGradientForSwipingCards[number];
}
