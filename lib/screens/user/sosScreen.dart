import 'package:flutter/material.dart';
import 'package:first_helpers/utilities/constants.dart';

class SosScreen extends StatelessWidget {
  const SosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Image.asset(
              'images/login.png',
              fit: BoxFit.fill,
            ),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: logoBlue,
                border: Border.all(
                  color: logoGreen,
                  width: 5,
                )),
          ),
        ],
      ),
    );
  }
}
