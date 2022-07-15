import 'package:first_helpers/screens/doctor/doc_landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:first_helpers/utilities/txtinputfield.dart';
import 'package:first_helpers/utilities/impButton.dart';

class DocSignupScreen extends StatelessWidget {
  static const routeName = 'doc-signup-screen';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
        body: Container(
          color: Colors.white,
          child: Center(
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                  child: ImportantButton(txt: 'Register', color: Colors.green.shade800, onPressed: (){},),
                ),
                TextButton(
                  child: const Text(
                    'Skip for now ->',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, DocLanding.routeName);
                  },
                ),
              ],
            ),
          ),
        ),
    );
  }
}


