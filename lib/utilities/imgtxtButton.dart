import 'package:flutter/material.dart';

class imgtxtButton extends StatelessWidget {
  String img;
  String txt;
  VoidCallback onPressed;

  imgtxtButton({required this.img, required this.txt, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      // color: const Color(0xff3987EB).withOpacity(0.5),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: const BorderSide(
          width: 3,
          color: Color(0xff3987EB),
        ),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: 121,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              Container(
                child: Image.asset(img),
                width: 75,
                height: 75,
              ),
              const SizedBox(
                height: 4,
              ),
              Container(
                child: Text(
                  txt,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}