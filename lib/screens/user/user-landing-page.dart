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
  int index = 0;

  List<Widget> navbarItems = [
    Icon(Icons.list_alt_rounded, size: 30),
    Icon(Icons.sos_rounded, size: 30),
    Icon(Icons.settings, size: 30),
    Icon(Icons.person_outline_rounded, size: 30),
  ];

  final screens = [
    BlogScreen(),
    SosScreen(),
    SettingScreen(),
    ProfileScreen(),
  ];

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
                Text(
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
          body: screens[index],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                iconTheme: const IconThemeData(
              color: Colors.white,
            )),
            child: CurvedNavigationBar(
              index: index,
              buttonBackgroundColor: logoBlue,
              items: navbarItems,
              color: logoGreen,
              height: 60,
              backgroundColor: Colors.transparent,
              animationDuration: Duration(milliseconds: 300),
              onTap: (index) => setState(() => this.index = index),
            ),
          ),
        ),
      ),
    );
  }
}
