import 'package:first_helpers/utilities/txtinputfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_helpers/utilities/impButton.dart';
import '../../utilities/constants.dart';

class SettingScreen extends StatelessWidget {

  final emailController = TextEditingController(text : 'xyz@abc.com');
  final nameController = TextEditingController(text: 'Patient Name');
  final numberController = TextEditingController(text: '1234567890');
  final secondaryNumberController = TextEditingController(text: '9876543210');
  final userHeightController = TextEditingController(text: "5'10");
  final userWeightController = TextEditingController(text: '69kg');
  final userBloodGroupController = TextEditingController(text: 'A+');
  final userAddressController = TextEditingController(text: "Hostel No. 12, Birla Institute of Technology, Mesra, Ranchi, Jharkhand");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: CupertinoScrollbar(
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            CircleAvatar(
              backgroundColor: Color.fromARGB(255, 214, 213, 213),
              radius: 80,
              child: ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(
                      MediaQuery.of(context).size.width * 0.4,
                      MediaQuery.of(context).size.height * 0.2)),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                        side: BorderSide(color: logoBlue)),
                  ),
                ),
                child: Icon(
                  Icons.add_a_photo_rounded,
                  color: Colors.black,
                ),
                onPressed: () {},
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
                  userInput: secondaryNumberController,
                  hintTitle: 'Secondary Phone Number:',
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
                  userInput: userHeightController,
                  hintTitle: 'Height:',
                  keyboardType: TextInputType.text,
                  showText: false),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
              child: TextInputField(
                  userInput: userWeightController,
                  hintTitle: 'Weight:',
                  keyboardType: TextInputType.text,
                  showText: false),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
              child: TextInputField(
                  userInput: userBloodGroupController,
                  hintTitle: 'Blood Group:',
                  keyboardType: TextInputType.text,
                  showText: false),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
              child: TextInputField(
                  userInput: userAddressController,
                  hintTitle: 'Permanent Address:',
                  keyboardType: TextInputType.streetAddress,
                  showText: false),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImportantButton(
                txt: 'Update',
                color: Colors.green.shade800,
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}