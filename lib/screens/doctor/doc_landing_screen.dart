import 'package:first_helpers/utilities/constants.dart';
import 'package:first_helpers/utilities/detailCardTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: CupertinoScrollbar(
                child: ListView(
                  children: <Widget>[
                    CardTile(patientName: "Patient 1", location: "Location 1", onpressed: (){},),
                    CardTile(patientName: "Patient 1", location: "Location 1", onpressed: (){},),
                    CardTile(patientName: "Patient 1", location: "Location 1", onpressed: (){},),
                    CardTile(patientName: "Patient 1", location: "Location 1", onpressed: (){},),
                    CardTile(patientName: "Patient 1", location: "Location 1", onpressed: (){},),
                    CardTile(patientName: "Patient 1", location: "Location 1", onpressed: (){},),
                    CardTile(patientName: "Patient 1", location: "Location 1", onpressed: (){},),
                    CardTile(patientName: "Patient 1", location: "Location 1", onpressed: (){},),
                    CardTile(patientName: "Patient 1", location: "Location 1", onpressed: (){},),
                    CardTile(patientName: "Patient 1", location: "Location 1", onpressed: (){},),
                    CardTile(patientName: "Patient 1", location: "Location 1", onpressed: (){},),
                    CardTile(patientName: "Patient 1", location: "Location 1", onpressed: (){},),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

