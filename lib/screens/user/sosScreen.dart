import 'package:flutter/material.dart';
import 'package:first_helpers/utilities/constants.dart';
import 'user-landing-page.dart';
import 'package:location/location.dart';
import 'package:first_helpers/utilities/getLocation.dart';

class SosScreen extends StatefulWidget {
  const SosScreen({Key? key}) : super(key: key);

  @override
  State<SosScreen> createState() => _SosScreenState();
}

class _SosScreenState extends State<SosScreen> {
  LocationData? currentLocation;

  @override
  void initState() {
    super.initState();
    initLocationService();
  }

  Future initLocationService() async {
    var location = Location();

    if (!await location.serviceEnabled()) {
      if (!await location.requestService()) {
        return;
      }
    }

    var permission = await location.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await location.requestPermission();
      if (permission != PermissionStatus.granted) {
        return;
      }
    }

    var loc = await location.getLocation();

    setState(() {
      currentLocation = loc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Text(
              "An Emergency?\nJust press the 'SOS' button below and we'll be on our way to your current location.",
              softWrap: true,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            child: Image.asset(
              'images/map.png',
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
                color: logoGreen,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: logoBlue,
                  width: 2,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 70.0,
              top: 8,
            ),
            child: GestureDetector(
              child: ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(180, 180)),
                  elevation: MaterialStateProperty.all(20),
                  shadowColor: MaterialStateProperty.all(Colors.red),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                        side: BorderSide(color: Colors.red)),
                  ),
                ),
                onPressed: () {
                  // print(currentLocation!.latitude.toString() +" "+ currentLocation!.longitude.toString());
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Latitude:"+currentLocation!.latitude.toString() +" "+"Longitude:"+currentLocation!.longitude.toString()),
                    duration: Duration(seconds: 4),
                  ));
                },
                child: Image.asset('images/sos.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// MediaQuery.of(context).size.width * 0.5,
// MediaQuery.of(context).size.height * 0.25


