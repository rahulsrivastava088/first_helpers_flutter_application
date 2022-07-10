import 'package:flutter/material.dart';

class CardTile extends StatelessWidget {
  String patientname;
  String location;

  CardTile({required this.patientname, required this.location});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ExpansionTile(
          leading: CircleAvatar(
            radius: 25,
          ),
          title: Text("$patientname"),
          subtitle: Text("Current Location: $location"),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: () {
                    print("Working");
                  },
                  child: Text("Book Appointment"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
