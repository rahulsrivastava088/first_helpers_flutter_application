import 'package:flutter/material.dart';

const logoGreen = Color(0xff24C069);
const logoBlue = Color(0xff3987EB);


const kSendButtonTextStyle = TextStyle(
  color: logoBlue,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: logoBlue, width: 2.0),
  ),
);