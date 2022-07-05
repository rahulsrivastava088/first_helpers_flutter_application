import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    Key? key,
    required this.userInput,
    required this.hintTitle,
    required this.keyboardType,
    required this.showText,
  }) : super(key: key);

  final TextEditingController userInput;
  final String hintTitle;
  final TextInputType keyboardType;
  final bool showText;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              hintTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextField(
            obscureText: showText,
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
                  borderSide: BorderSide(color: Colors.blue)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Colors.green)),

            ),
          ),
        ],
      ),
    );
  }
}