import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:first_helpers/utilities/constants.dart';
import 'blogScreen.dart';
import 'package:first_helpers/screens/user/profileScreen.dart';
import 'package:first_helpers/screens/user/sosScreen.dart';
import 'package:first_helpers/screens/user/settingsScreen.dart';


class UserLanding extends StatefulWidget {
  const UserLanding({Key? key}) : super(key: key);

  static const routeName = 'user-landing-screen';
  @override
  State<UserLanding> createState() => _UserLandingState();
}

class _UserLandingState extends State<UserLanding> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  List<Widget> navbarItems = [
    Icon(Icons.list_alt_rounded),
    Icon(Icons.sos_rounded),
    Icon(Icons.settings),
    Icon(Icons.person_outline_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: logoGreen,
      child: SafeArea(
        child: Scaffold(
          extendBody: true,
          // appBar: AppBar(title: Text("Title"));
          key: scaffoldKey,
          appBar: AppBar(
            title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        print("working");
                      },
                      icon: Image.asset('images/logoimage.png')),
                  Text(
                    'FIRST HELPERS',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0,
          ),
          // body:
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                iconTheme: const IconThemeData(
              color: Colors.white,
            )),
            child: CurvedNavigationBar(
              buttonBackgroundColor: logoBlue,
              items: navbarItems,
              color: logoGreen,
              height: 60,
              backgroundColor: Colors.transparent,
              animationDuration: Duration(milliseconds: 300),
            ),
          ),
        ),
      ),
    );
  }
}
