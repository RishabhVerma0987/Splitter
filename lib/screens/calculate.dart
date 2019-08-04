import 'package:flutter/material.dart';

class CalculatePage extends StatelessWidget {
  static String calculatePageId = 'calculatePageScreen';
  const CalculatePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Page(),
    );
  }
}

class Page extends StatefulWidget {
  Page({Key key}) : super(key: key);

  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 80, 30, 0),
      child: Column(
        children: <Widget>[TextField()],
      ),
    );
  }
}
