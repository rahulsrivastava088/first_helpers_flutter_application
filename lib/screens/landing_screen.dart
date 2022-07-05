import 'package:first_helpers/screens/login_screen.dart';
import 'package:first_helpers/screens/user/user_signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:first_helpers/utilities/imgtxtButton.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  static const routeName = 'landing-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Image.asset('images/logoimage.png'),
              width: 100,
            ),
            Container(
              child: Image.asset('images/brandname.png'),
              height: 60,
            ),
            Container(
              child: Image.asset('images/landing.gif'),
              height: 390,
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: imgtxtButton(
                      img: 'images/ambulance.gif',
                      txt: 'PARAMEDIC',
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: imgtxtButton(
                      img: 'images/doctor.gif',
                      txt: 'DOCTOR',
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Hero(
                      tag: 'user.gif',
                      child: imgtxtButton(
                        img: 'images/user.gif',
                        txt: 'USER',
                        onPressed: () {
                          Navigator.pushNamed(
                              context, UserSignupScreen.routeName);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already Registered?',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
