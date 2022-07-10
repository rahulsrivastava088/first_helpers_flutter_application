import 'package:first_helpers/utilities/constants.dart';
import 'package:flutter/material.dart';


class MessageBubble extends StatelessWidget {
  MessageBubble({required this.sender, required this.text, required this.isMe});

  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 3.0),
          child: Text(
            sender,
            style: TextStyle(
              fontSize: 8.0,
              color: Colors.grey,
            ),
          ),
        ),
        Material(
            color: isMe ? logoBlue : logoGreen,
            elevation: 5.0,
            borderRadius: BorderRadius.circular(30.0),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                ),
              ),
            )),
      ],
    );
  }
}