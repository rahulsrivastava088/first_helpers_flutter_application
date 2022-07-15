import 'package:first_helpers/utilities/chatCardTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utilities/constants.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Medical Reports",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: CupertinoScrollbar(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: new BorderSide(color: logoBlue, width: 2.0),
                ),
                margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.picture_as_pdf_rounded,
                            color: Colors.red,
                            size: 20,
                          ),
                          SizedBox(width: 10,),
                          Text(
                            'Blood Pressure Reports',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text("Date : 24 June '22"),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: new BorderSide(color: logoBlue, width: 2.0),
                ),
                margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.picture_as_pdf_rounded,
                            color: Colors.red,
                            size: 20,
                          ),
                          SizedBox(width: 10,),
                          Text(
                            'Blood Sugar Reports',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text("Date : 23 June '22"),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: new BorderSide(color: logoBlue, width: 2.0),
                ),
                margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.picture_as_pdf_rounded,
                            color: Colors.red,
                            size: 20,
                          ),
                          SizedBox(width: 10,),
                          Text(
                            'Body Temp. Reports',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text("Date : 20 June '22"),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
