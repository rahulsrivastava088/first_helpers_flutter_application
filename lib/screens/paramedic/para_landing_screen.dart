import 'package:first_helpers/screens/paramedic/para_doctor_screen.dart';
import 'package:flutter/material.dart';
import 'package:first_helpers/utilities/constants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'para_dashboard_screen.dart';

class ParaLandingScreen extends StatefulWidget {
  const ParaLandingScreen({Key? key}) : super(key: key);

  static const routeName = "para-landing-screen";

  @override
  State<ParaLandingScreen> createState() => _ParaScreenState();
}

class _ParaScreenState extends State<ParaLandingScreen> {

  int index = 0;

  List<Widget> navbarItems = [
    Icon(Icons.sos_rounded, size: 30),
    Icon(Icons.medical_services_rounded, size: 30),
  ];

  final screens = [
    ParaDashboard(),
    ParaDoctor(),
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
                const Text(
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
              animationDuration: const Duration(milliseconds: 300),
              onTap: (index) => setState(() => this.index = index),
            ),
          ),
        ),
      ),
    );
  }
}
