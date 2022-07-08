import 'package:first_helpers/utilities/detailCardTile.dart';
import 'package:flutter/material.dart';

class ParaLanding extends StatefulWidget {
  const ParaLanding({Key? key}) : super(key: key);

  static const routeName = "para-landing-screen";

  @override
  State<ParaLanding> createState() => _ParaLandingState();
}

class _ParaLandingState extends State<ParaLanding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: [
          IconButton(
            onPressed: (){
              showModalBottomSheet(context: context, builder: (BuildContext context){
                return Container(
                  height: 300,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 40,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Name: Paramedic Operator Name"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Phone Number: 1234567890"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Hospital Name: XYZ Hospital"),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              });
            },
            icon: Icon(Icons.badge_rounded),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          CardTile(patientname: "Patient 1", location: "Location 1"),
          CardTile(patientname: "Patient 2", location: "Location 2"),
          CardTile(patientname: "Patient 3", location: "Location 3"),
          CardTile(patientname: "Patient 4", location: "Location 4"),
          CardTile(patientname: "Patient 5", location: "Location 5"),
          CardTile(patientname: "Patient 6", location: "Location 6"),
          CardTile(patientname: "Patient 7", location: "Location 7"),
        ],
      ),
    );
  }
}

