import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:first_helpers/utilities/txtinputfield.dart';
import 'package:first_helpers/utilities/impButton.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = 'login-screen';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Image.asset('images/login.png'),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
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
                  onPressed: () {},
                ),
              ],
            ),
        ),
    );
  }
}
