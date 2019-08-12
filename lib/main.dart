import 'package:flutter/material.dart';
import 'screens/signIn.dart';
import 'state/credentials.dart';
import 'package:provider/provider.dart';
import 'screens/signOut..dart';
import 'screens/homepage.dart';
import 'screens/splitMoney.dart';
//import 'screens/calculate.dart';
import 'screens/clone.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Credentials>(
      builder: (context) => Credentials(),
      child: MaterialApp(
        title: 'login page',
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        //initialRoute: Home.home_Id,
        initialRoute: SplitMoney.splitMoneyId,
        routes: {
          SignIn.screenId: (context) => SignIn(),
          SignOut.screenId: (context) => SignOut(),
          CalculatePage.calculatePageId: (context) => CalculatePage(),
          Homepage.homePageId: (context) => Homepage()
        },
        //home: Home(),
        home: SplitMoney(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  static String home_Id = 'Home_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: SignIn());
  }
}
