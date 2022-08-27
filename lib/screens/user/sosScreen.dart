import 'dart:async';

import 'package:flutter/material.dart';
import 'package:first_helpers/utilities/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'user-landing-page.dart';
import 'package:location/location.dart';
import 'package:first_helpers/utilities/loadingSpinner.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart' hide Location;

final FirebaseAuth auth = FirebaseAuth.instance;

class SosScreen extends StatefulWidget {
  const SosScreen({Key? key}) : super(key: key);

  @override
  State<SosScreen> createState() => _SosScreenState();
}

class _SosScreenState extends State<SosScreen> {
  late bool showLoading;
  late LocationData currentLocation;
  late CameraPosition kGooglePost;
  late List<Marker> marker;
  late String address;

  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
    initLocationService();
    // getAddress(currentLocation.latitude, currentLocation.longitude);
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
        var camPos = CameraPosition(
      target: LatLng(loc.latitude!.toDouble(), loc.longitude!.toDouble()),
      zoom: 14.4746,
    );
    List<Marker> maarker = [
        Marker(
        markerId: MarkerId('0'),
        position: LatLng(loc.latitude!.toDouble(),
            loc.longitude!.toDouble()),
        infoWindow: const InfoWindow(title: 'Your Location'),
      ),
    ];

    // await getAddress(loc.latitude, loc.longitude);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(loc.latitude!, loc.longitude!);
    String add = placemarks.reversed.last.street.toString() +
        ", " +
        placemarks.reversed.last.locality.toString() +
        ", " +
        placemarks.reversed.last.administrativeArea.toString();


    setState(() {
      showLoading = false;
      currentLocation = loc;
      kGooglePost = camPos;
      marker = maarker;
      address = add;
    });
  }

  // void getAddress(latitude, longitude) async {
  //   List<Placemark> placemarks =
  //       await placemarkFromCoordinates(latitude, longitude);
  //   address = placemarks.reversed.last.street.toString() +
  //       " " +
  //       placemarks.reversed.last.administrativeArea.toString() +
  //       " " +
  //       placemarks.reversed.last.locality.toString();
  // }

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
                      initialCameraPosition: kGooglePost,
                      myLocationButtonEnabled: false,
                      mapType: MapType.hybrid,
                      markers: Set<Marker>.from(marker),
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
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
                      onPressed: () async {
                        // print(currentLocation!.latitude.toString() +" "+ currentLocation!.longitude.toString());
                        var snap = await FirebaseFirestore.instance
                            .collection('users')
                            .doc(auth.currentUser!.uid)
                            .get();

                        Map<String, dynamic> data = {
                          'name': snap.data()?['name'],
                          'phoneNumber': snap.data()?['phoneNumber'],
                          'latitude': currentLocation.latitude,
                          'longitude': currentLocation.longitude,
                          'uid': auth.currentUser!.uid,
                          'address' : address,
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

