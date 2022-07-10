import 'package:first_helpers/screens/paramedic/para_landing_screen.dart';
import 'package:first_helpers/screens/doctor/doc_signup_screen.dart';
import 'package:first_helpers/screens/paramedic/para_signup_screen.dart';
import 'package:first_helpers/screens/chatScreen.dart';
import 'package:flutter/material.dart';
import 'package:first_helpers/screens/landing_screen.dart';
import 'package:first_helpers/screens/user/user_signup_screen.dart';
import 'package:first_helpers/screens/login_screen.dart';
import 'package:first_helpers/screens/user/user-landing-page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Ubuntu'),
      debugShowCheckedModeBanner: false,
      initialRoute: LandingScreen.routeName,
      routes: {
        LandingScreen.routeName: (context) => LandingScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        UserSignupScreen.routeName: (context) => UserSignupScreen(),
        DocSignupScreen.routeName: (context) => DocSignupScreen(),
        ParaSignupScreen.routeName: (context) => ParaSignupScreen(),
        UserLanding.routeName:(context) => UserLanding(),
        ParaLanding.routeName:(context) => ParaLanding(),
        ChatScreen.routeName:(context) => ChatScreen(),
      },
    ); // This trailing comma makes auto-formatting nicer for build methods.);
  }
}
