import 'package:flutter/material.dart';
import 'package:first_helpers/utilities/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'user-landing-page.dart';
import 'package:location/location.dart';
import 'package:first_helpers/utilities/loadingSpinner.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class SosScreen extends StatefulWidget {
  const SosScreen({Key? key}) : super(key: key);

  @override
  State<SosScreen> createState() => _SosScreenState();
}

class _SosScreenState extends State<SosScreen> {
  late bool showLoading;
  LocationData? currentLocation;

  static const CameraPosition _kGooglePost = CameraPosition(
    target: LatLng(37.4279, -122.0857),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    initLocationService();
  }

  Future initLocationService() async {
    var location = Location();

    setState(() {
      showLoading = true;
    });
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
      showLoading = false;
      currentLocation = loc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showLoading
          ? LoadingScreen(
              hintText: "Fetching Location..",
            )
          : Column(
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
                SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width * 0.97,
                  child: Container(
                    child: GoogleMap(
                      initialCameraPosition: _kGooglePost,
                      myLocationEnabled: false,
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
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                              side: BorderSide(color: Colors.red)),
                        ),
                      ),
                      onPressed: () async{
                        // print(currentLocation!.latitude.toString() +" "+ currentLocation!.longitude.toString());
                        var snap = await FirebaseFirestore.instance
                            .collection('users')
                            .doc(auth.currentUser!.uid)
                            .get();

                        Map<String, dynamic> data = {
                          'name': snap.data()?['name'],
                          'phoneNumber': snap.data()?['phoneNumber'],
                          'latitude': currentLocation!.latitude,
                          'longitude': currentLocation!.longitude,
                          'uid': auth.currentUser!.uid
                        };
                        FirebaseFirestore.instance
                            .collection('locations')
                            .doc(auth.currentUser!.uid)
                            .set(data);
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


