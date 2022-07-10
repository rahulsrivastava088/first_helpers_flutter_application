import 'package:first_helpers/utilities/constants.dart';
import 'package:flutter/material.dart';

class SettingInputField extends StatelessWidget {
  const SettingInputField({
    Key? key,
    required this.userInput,
    required this.hintTitle,
    required this.keyboardType,
    required this.showText,
    required this.title,
  }) : super(key: key);

  final TextEditingController userInput;
  final String hintTitle;
  final String title;
  final TextInputType keyboardType;
  final bool showText;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 2,),
            child: Text(
              hintTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextFormField(
            obscureText: showText,
            initialValue: title,
            controller: userInput,
            autocorrect: false,
            enableSuggestions: false,
            autofocus: false,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: logoBlue)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: logoGreen)),
            ),
          ),
        ],
      ),
    );
  }
}
