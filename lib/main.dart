import 'package:flutter/material.dart';
import 'package:first_helpers/screens/landing_screen.dart';
import 'package:first_helpers/screens/user/user_signup_screen.dart';
import 'package:first_helpers/screens/login_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LandingScreen.routeName,
      routes: {
        LandingScreen.routeName: (context) => LandingScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        UserSignupScreen.routeName: (context) => UserSignupScreen(),
      },
    ); // This trailing comma makes auto-formatting nicer for build methods.);
  }
}
