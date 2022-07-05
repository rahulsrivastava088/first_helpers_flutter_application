import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:first_helpers/utilities/txtinputfield.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = 'login-screen';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 45),
        Padding(
          padding: const EdgeInsets.only(
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
          child: TextInputField(userInput: emailController, hintTitle: 'Email:', keyboardType: TextInputType.emailAddress, showText: false),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
          child: TextInputField(userInput: passwordController, hintTitle: 'Password:', keyboardType: TextInputType.visiblePassword, showText: true),
        ),
        Container(
          height: 55,
          padding: const EdgeInsets.only(top: 5, left: 70, right: 70),
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)))),
            onPressed: () {
              print(emailController);
              print(passwordController);
            },
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.only(top: 5, left: 70, right: 70),
          child: TextButton(
            child: Text(
              "SignIn with Google",
              style: TextStyle(fontSize: 15),
            ),
            onPressed: () {
              print("working");
            },
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 2, left: 70, right: 70),
          child: TextButton(
            child: Text(
              "SignIn with Phone Number",
              style: TextStyle(fontSize: 15),
            ),
            onPressed: () {
              print("working");
            },
          ),
        )
      ],
    )));
  }
}

