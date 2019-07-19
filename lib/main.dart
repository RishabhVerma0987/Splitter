import 'package:flutter/material.dart';
import 'screens/signIn.dart';
import 'state/credentials.dart';
import 'package:provider/provider.dart';
//import 'screens/try.dart';
import 'screens/signOut..dart';
import 'screens/mL.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'login page',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: ChangeNotifierProvider<Credentials>(
        builder: (context) => Credentials(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Home(),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextRecognizer();
  }
}
