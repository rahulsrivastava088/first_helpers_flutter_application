import 'package:first_helpers/utilities/constants.dart';
import 'package:first_helpers/utilities/detailCardTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maps_launcher/maps_launcher.dart';

class ParaDashboard extends StatefulWidget {
  const ParaDashboard({Key? key}) : super(key: key);

  @override
  State<ParaDashboard> createState() => _ParaLandingState();
}

class _ParaLandingState extends State<ParaDashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Dashboard",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.refresh_rounded),
            color: Colors.black,
          ),
        ],
      ),
      body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection("locations").snapshots(),
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
                          return CardTile(
                            patientName: data['name'] == null
                                ? "Anonymous"
                                : data['name'],
                            location: data['address'].toString(),
                            accept: () async {
                              Map<String, dynamic> docData = {
                                'name': data['name'] == null
                                    ? "Anonymous"
                                    : data['name'],
                                'phoneNumber': data['phoneNumber'] == null
                                    ? "Not Available!"
                                    : data['phoneNumber'],
                              };
                              await FirebaseFirestore.instance
                                  .collection("docAccepted")
                                  .doc(data['uid'])
                                  .set(docData);
                              MapsLauncher.launchCoordinates(
                                  data['latitude'], data['longitude']);
                            },
                            delete: () async{
                              await FirebaseFirestore.instance
                                  .runTransaction(
                                      (Transaction myTransaction) async {
                                await myTransaction
                                    .delete(data.reference);
                              });
                            }
                          );
                        }))),
              );
            }
          }),
    );
  }
}
