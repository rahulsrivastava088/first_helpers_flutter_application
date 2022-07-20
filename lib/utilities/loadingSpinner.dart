import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  String hintText;
  LoadingScreen({required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFadingCircle(
              color: logoGreen,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(hintText),
            ),
          ],
        ),
      ),
    );
  }
}
