import 'package:first_helpers/utilities/messageBubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_helpers/utilities/constants.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);
  static const routeName = 'chat-screen';
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          "Doctor 1",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.call_rounded),
            color: Colors.black,
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CupertinoScrollbar(
                child: ListView(
                  reverse: true,
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                  children: [
                    MessageBubble(sender: "Me", text: lorem(paragraphs: 1,words: 5), isMe: true),
                    MessageBubble(sender: "Doctor 1", text: lorem(paragraphs: 1,words: 7), isMe: false),
                    MessageBubble(sender: "Me", text: lorem(paragraphs: 1,words: 4), isMe: true),
                    MessageBubble(sender: "Doctor 1", text: lorem(paragraphs: 1,words: 3), isMe: false),
                    MessageBubble(sender: "Me", text: "Magar operation se darta hu", isMe: true),
                    MessageBubble(sender: "Doctor 1", text: lorem(paragraphs: 1,words: 5), isMe: false),
                    MessageBubble(sender: "Me", text: "Mujhe kabz hai", isMe: true),
                    MessageBubble(sender: "Doctor 1", text: lorem(paragraphs: 1,words: 7), isMe: false),
                    MessageBubble(sender: "Me", text: lorem(paragraphs: 1,words: 5), isMe: true),
                    MessageBubble(sender: "Doctor 1", text: lorem(paragraphs: 1,words: 2), isMe: false),
                    MessageBubble(sender: "Me", text: lorem(paragraphs: 1,words: 5), isMe: true),
                    MessageBubble(sender: "Doctor 1", text: lorem(paragraphs: 1,words: 3), isMe: false),
                  ],
                ),
              ),
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      print("Working");
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
