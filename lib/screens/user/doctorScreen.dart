import 'package:first_helpers/utilities/chatCardTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection("docs").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Container(child: Center(child: Text("Empty")));
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: CupertinoScrollbar(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: ((context, index) {
                      DocumentSnapshot data = snapshot.data!.docs[index];

                      return ChatTile(
                          username: data['name'],
                          field: data['specialization'],
                          imageUrl:
                              "https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?w=2000");
                    }),
                  ),
                ),
              );
            }
          }),
    );
  }

  //  ChatTile(username: "Doctor 1", imageUrl: "https://img.freepik.coee-vector/doctor-character-background_1270-84.jpg?w=2000"),
}
