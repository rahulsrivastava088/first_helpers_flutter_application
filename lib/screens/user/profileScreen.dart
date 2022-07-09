import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Color.fromARGB(255, 214, 213, 213),
              radius: 80,
              child: Icon(
                Icons.add_a_photo_rounded,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Card(
            // elevation: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              userDetail(title: "Name", userData: "Patient Name"),
              userDetail(title: "Phone Number", userData: "1234567890"),
              userDetail(title: "Secondary Phone Number", userData: "9876543210"),
              userDetail(title: "Email Address", userData: "xyz@abc.com"),
              Row(
                children: [
                  userDetail(title: "Height", userData: "5'10"),
                  userDetail(title: "Weight", userData: "69kg"),
                  userDetail(title: "Blood Group", userData: "A+"),
                ],
              ),
              userDetail(
                  title: "Permanent Address",
                  userData:
                      "Hostel No. 12, Birla Institute of Technology, Mesra, Ranchi, Jharkhand"),
            ]),
          ),
        )
      ],
    ));
  }
}

class userDetail extends StatelessWidget {
  String title;
  String userData;
  userDetail({required this.title, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title + ":",
            style: TextStyle(fontSize: 11, color: Colors.grey),
          ),
          Text(
            userData,
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
