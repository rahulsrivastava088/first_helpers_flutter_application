import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_helpers/screens/user/user-landing-page.dart';
import 'package:flutter/material.dart';
import 'package:first_helpers/utilities/txtinputfield.dart';
import 'package:first_helpers/utilities/impButton.dart';
import 'package:first_helpers/utilities/authorization.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = 'user-signup-screen';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final numberController = TextEditingController();

  var authHandler = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: Container(
          color: Colors.white,
          child: Center(
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Image.asset('images/login.png'),
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
                      userInput: numberController,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImportantButton(
                    txt: 'Register',
                    color: Colors.green.shade800,
                    onPressed: () {
                      authHandler
                          .handleSignUp(emailController.text.trim(),
                              passwordController.text.trim())
                          .then((User user) {
                        Map<String, dynamic> data = {
                          'name': nameController.text,
                          'phoneNumber': numberController.text.trim(),
                          'email': emailController.text.trim(),
                          'uid': user.uid,
                        };
                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(user.uid)
                            .set(data);
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            UserLanding.routeName,
                            (Route<dynamic> route) => false);
                      }).catchError((e) => print(e));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
