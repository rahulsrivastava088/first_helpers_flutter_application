import 'package:first_helpers/utilities/chatCardTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:first_helpers/utilities/constants.dart';

class ParaDoctor extends StatelessWidget {
  const ParaDoctor({Key? key}) : super(key: key);

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
          stream: FirebaseFirestore.instance.collection("docs").snapshots(),
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

                      // return ChatTile(
                      //     username: data['name'],
                      //     field: data['specialization'],
                      //     imageUrl:
                      //         "https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?w=2000");

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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: 25,
                                          backgroundImage:
                                              Image.network("https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?w=2000").image,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            data['name'],
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        data['specialization'],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        MaterialButton(
                                          onPressed: () async {
                                            print("Working");
                                            bool? res = await FlutterPhoneDirectCaller.callNumber(data['phoneNumber']);
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.call_sharp,
                                                size: 20,
                                              ),
                                              Text(
                                                "Call",
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
