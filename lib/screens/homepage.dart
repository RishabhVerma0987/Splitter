import 'package:flutter/material.dart';
import 'calculate.dart';

class Homepage extends StatefulWidget {
  static String homePageId = 'Home_Page_screen';
  Homepage({Key key}) : super(key: key);

  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You Owe',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '30',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w200,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You are Owed',
                    style: TextStyle(color: Colors.green),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '20',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 60,
          right: 40,
          child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => CalculatePage()));
              },
              child: Icon(Icons.add)),
        )
      ],
    ));
  }
}
