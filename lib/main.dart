import 'package:first_helpers/screens/doctor/doc_landing_screen.dart';
import 'package:first_helpers/screens/doctor/doc_login_screen.dart';
import 'screens/paramedic/para_landing_screen.dart';
import 'package:first_helpers/screens/chatScreen.dart';
import 'package:first_helpers/screens/paramedic/para_login_screen.dart';
import 'package:first_helpers/screens/signupScreen.dart';
import 'package:first_helpers/screens/user/settingsScreen.dart';
import 'package:first_helpers/screens/user/user_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:first_helpers/screens/landing_screen.dart';
import 'package:first_helpers/screens/user/user-landing-page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
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
        SignUpScreen.routeName: (context) => SignUpScreen(),
        ParaLoginScreen.routeName: (context) => ParaLoginScreen(),
        DocLoginScreen.routeName: (context) => DocLoginScreen(),
        UserLoginScreen.routeName: (context) => UserLoginScreen(),
        UserLanding.routeName: (context) => UserLanding(),
        ParaLandingScreen.routeName: (context) => ParaLandingScreen(),
        ChatScreen.routeName: (context) => ChatScreen(),
        DocLanding.routeName: (context) => DocLanding(),
        SettingScreen.routeName: (context) => SettingScreen(),
      },
    );
  }
}
