import 'package:first_helpers/screens/doctor/doc_landing_screen.dart';
import 'package:first_helpers/screens/paramedic/para_landing_screen.dart';
import 'package:first_helpers/screens/doctor/doc_signup_screen.dart';
import 'package:first_helpers/screens/paramedic/para_signup_screen.dart';
import 'package:first_helpers/screens/chatScreen.dart';
import 'package:first_helpers/screens/user/settingsScreen.dart';
import 'package:flutter/material.dart';
import 'package:first_helpers/screens/landing_screen.dart';
import 'package:first_helpers/screens/user/user_signup_screen.dart';
import 'package:first_helpers/screens/login_screen.dart';
import 'package:first_helpers/screens/user/user-landing-page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        DocLanding.routeName:(context) => DocLanding(),
        SettingScreen.routeName:(context) => SettingScreen(),
      },
    );
  }
}
