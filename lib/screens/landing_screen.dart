import 'package:first_helpers/screens/doctor/doc_login_screen.dart';
import 'package:first_helpers/screens/paramedic/para_dashboard_screen.dart';
import 'package:first_helpers/screens/paramedic/para_login_screen.dart';
import 'package:first_helpers/screens/signupScreen.dart';
import 'package:first_helpers/screens/user/user_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:first_helpers/utilities/imgtxtButton.dart';
import 'package:gif/gif.dart';

class LandingScreen extends StatelessWidget {
  static const routeName = 'landing-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Image.asset('images/logoimage.png'),
              width: 100,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Image.asset('images/brandname.png'),
              height: 60,
            ),
            Container(
              child: Gif(
                image: AssetImage('images/landing.gif'),
                fps: 30,
                autostart: true,
              ),
              height: MediaQuery.of(context).size.width,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.5),
                    child: SizedBox(
                      // width: MediaQuery.of(context).size.width * 0.3,
                      child: Hero(
                        tag: 'para.gif',
                        child: imgtxtButton(
                          img: 'images/ambulance.gif',
                          txt: 'PARAMEDIC',
                          onPressed: () {
                            Navigator.pushNamed(
                                context, ParaLoginScreen.routeName);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.5),
                    child: SizedBox(
                      // width: MediaQuery.of(context).size.width * 0.3,
                      child: Hero(
                        tag: 'doc.gif',
                        child: imgtxtButton(
                          img: 'images/doctor.gif',
                          txt: 'DOCTOR',
                          onPressed: () {
                            Navigator.pushNamed(
                                context, DocLoginScreen.routeName);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.5),
                    child: SizedBox(
                      // width: MediaQuery.of(context).size.width * 0.3,
                      child: Hero(
                        tag: 'user.gif',
                        child: imgtxtButton(
                          img: 'images/user.gif',
                          txt: 'USER',
                          onPressed: () {
                            Navigator.pushNamed(
                                context, UserLoginScreen.routeName);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'New User?',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  child: const Text(
                    'REGISTER',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, SignUpScreen.routeName);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
