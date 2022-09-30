import 'package:first_helpers/utilities/constants.dart';
import 'package:first_helpers/utilities/docDashDetailCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';


class DocLanding extends StatefulWidget {
  const DocLanding({Key? key}) : super(key: key);

  static const routeName = "doc-landing-screen";

  @override
  State<DocLanding> createState() => _DocLandingState();
}

class _DocLandingState extends State<DocLanding> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: logoGreen,
      child: SafeArea(
        child: Scaffold(
          extendBody: true,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      print("working");
                    },
                    icon: Image.asset('images/logoimage.png')),
                const Text(
                  'FIRST HELPERS',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0,
          ),
          body: Scaffold(
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
            body: CupertinoScrollbar(
              child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("docAccepted")
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Container(
                    child: Center(child: Text("Empty"))
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: CupertinoScrollbar(
                        child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: ((context, index) {
                              DocumentSnapshot data =
                                  snapshot.data!.docs[index];
                              return CardTile(
                                patientName: data['name'],
                                phonenumber: data['phoneNumber'],
                                onCall: ()async{
                                  bool? res = await FlutterPhoneDirectCaller.callNumber(data['phoneNumber']);
                                },
                                onpressed: ()async{
                                  await FirebaseFirestore.instance
                                      .runTransaction(
                                          (Transaction myTransaction) async {
                                    await myTransaction
                                        .delete(data.reference);
                                  });
                                },
                              );
                            }))),
                  );
                }
              }),
            ),
          ),
        ),
      ),
    );
  }
}

