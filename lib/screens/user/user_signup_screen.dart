import 'package:first_helpers/screens/landing_screen.dart';
import 'package:first_helpers/screens/user/user-landing-page.dart';
import 'package:flutter/material.dart';
import 'package:first_helpers/utilities/txtinputfield.dart';

class UserSignupScreen extends StatelessWidget {
  static const routeName = 'user-signup-screen';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Container(
      color: Colors.white,
      // clipBehavior: Clip.hardEdge,
      // decoration: BoxDecoration(gradient: LinearGradient(
      //     begin: Alignment.topCenter,
      //     end: Alignment.bottomCenter,
      //     colors: [
      //       Color.fromARGB(255, 255, 255, 255),
      //       Color.fromARGB(255, 109, 209, 255),
      //     ])),
      child: Center(
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            Hero(
              tag: 'user.gif',
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: Image.asset('images/user.gif'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
              child: Text(
                "Get Started!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
              child: TextInputField(
                  userInput: nameController,
                  hintTitle: 'Full Name:',
                  keyboardType: TextInputType.name,
                  showText: false),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
              child: TextInputField(
                  userInput: emailController,
                  hintTitle: 'Phone Number:',
                  keyboardType: TextInputType.number,
                  showText: false),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
              child: TextInputField(
                  userInput: emailController,
                  hintTitle: 'Email:',
                  keyboardType: TextInputType.emailAddress,
                  showText: false),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
              child: TextInputField(
                  userInput: passwordController,
                  hintTitle: 'Password:',
                  keyboardType: TextInputType.visiblePassword,
                  showText: true),
            ),
            Container(
              height: 55,
              padding: const EdgeInsets.only(top: 5, left: 70, right: 70),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.green.shade800),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)))),
                onPressed: () {
                  print(emailController);
                  print(passwordController);
                  Navigator.pushNamed(context, UserLanding.routeName);
                },
                child: Text(
                  'Register!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
