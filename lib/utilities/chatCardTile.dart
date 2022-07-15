import 'package:flutter/material.dart';
import 'package:first_helpers/screens/chatScreen.dart';

import 'constants.dart';

class ChatTile extends StatelessWidget {
  String username;
  String imageUrl;

  ChatTile({required this.username, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: new BorderSide(color: logoBlue, width: 2.0),
          ),
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 15.0, bottom: 5.0, left: 15, right: 5),
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: Image.network(imageUrl).image,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          username,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          print("Working");
                          Navigator.pushNamed(context, ChatScreen.routeName);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.message_rounded,
                              size: 20,
                            ),
                            Text(
                              "Start Chat!",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ]),
          )),
    );
  }
}
