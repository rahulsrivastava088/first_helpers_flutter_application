import 'package:flutter/material.dart';
import 'package:first_helpers/utilities/constants.dart';

class SosScreen extends StatelessWidget {
  const SosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0,),
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
            padding: const EdgeInsets.only(bottom: 70.0, top: 8,),
            child: GestureDetector(
              child: ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(
                      MediaQuery.of(context).size.width * 0.5,
                      MediaQuery.of(context).size.height * 0.25)),
                  elevation: MaterialStateProperty.all(20),
                  shadowColor: MaterialStateProperty.all(Colors.red),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                        side: BorderSide(color: Colors.red)),
                  ),
                ),
                onPressed: () {},
                child: Image.asset('images/sos.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
