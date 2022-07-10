import 'package:first_helpers/utilities/constants.dart';
import 'package:first_helpers/utilities/imgtxtButton.dart';
import 'package:flutter/material.dart';

class CardTile extends StatelessWidget {
  String patientName;
  String location;

  CardTile({required this.patientName, required this.location});

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
        child: ExpansionTile(
          leading: CircleAvatar(
            child: Image.network(
              'https://thumbs.dreamstime.com/b/male-patient-profile-icon-circle-shape-flat-style-vector-eps-147647670.jpg',
            ),
            radius: 25,
          ),
          title: Text("$patientName"),
          subtitle: Text("Current Location:  $location"),
          textColor: Colors.green.shade700,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: () {
                    print("Working");
                  },
                  child: Text(
                    "ACCEPT",
                    style: TextStyle(
                      color: Colors.green.shade700,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
