import 'package:flutter/material.dart';
import 'package:first_helpers/utilities/txtinputfield.dart';
import 'package:first_helpers/utilities/impButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_helpers/utilities/authorization.dart';
import 'doc_landing_screen.dart';

class DocLoginScreen extends StatelessWidget {
  static const routeName = 'doc-login-screen';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var authHandler = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'doc.gif',
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Image.asset('images/doctor.gif'),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
              child: Text(
                "Welcome back!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
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
            ImportantButton(
              txt: 'Login',
              color: Colors.green,
              onPressed: () {
                authHandler
                    .handleSignInEmail(emailController.text.trim(),
                        passwordController.text.trim())
                    .then((User user) {
                  Navigator.pushNamed(context, DocLanding.routeName);
                }).catchError((e) => print(e));
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                child: const Text(
                  'Skip for now ->',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, DocLanding.routeName);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
