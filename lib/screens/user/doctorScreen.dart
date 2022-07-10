import 'package:first_helpers/utilities/chatCardTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DoctorScreen extends StatelessWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Available Doctors",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: CupertinoScrollbar(
        child: ListView(
          children: [
            ChatTile(username: "Doctor 1", imageUrl: "https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?w=2000"),
            ChatTile(username: "Doctor 2", imageUrl: "https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?w=2000"),
            ChatTile(username: "Doctor 3", imageUrl: "https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?w=2000"),
            ChatTile(username: "Doctor 4", imageUrl: "https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?w=2000"),
            ChatTile(username: "Doctor 5", imageUrl: "https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?w=2000"),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
