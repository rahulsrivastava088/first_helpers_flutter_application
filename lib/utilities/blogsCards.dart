import 'package:flutter/material.dart';


class BlogCard extends StatelessWidget {
  String headline;
  String subtitle;

  BlogCard({required this.headline, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        // margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(headline, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
              ),
              Text(subtitle)
              ],
          ),
        ),
      ),
    );
  }
}
