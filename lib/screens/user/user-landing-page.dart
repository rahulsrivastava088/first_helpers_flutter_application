import 'package:flutter/material.dart';

class UserLanding extends StatefulWidget {
  const UserLanding({Key? key}) : super(key: key);

  static const routeName = 'user-landing-screen';
  @override
  State<UserLanding> createState() => _UserLandingState();
}

class _UserLandingState extends State<UserLanding> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // appBar: AppBar(title: Text("Title")),
      key: scaffoldKey,
      drawer: Container(
        width: 200,
        child: Drawer(
          child: ListView(
            children: [
              Container(
                height: 200,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.lightBlue, Colors.green]),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.male, color: Colors.black),
                          radius: 50,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Full Name",
                            style: TextStyle(),
                          ),
                        )
                      ]),
                ),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Item 3'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.green, size: 30),
        actions: [
          IconButton(
              onPressed: () {
                print("working");
              },
              icon: Image.asset('images/logoimage.png'))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          GestureDetector(
            onTap: () {
              print("Working");
            },
            child: Container(
              child: Center(
                child: Text(
                  "Generate SOS!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              color: Colors.blue,
              width: double.infinity,
              height: 70,
            ),
          )
        ],
      ),
    ));
  }
}
