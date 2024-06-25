import 'package:flutter/material.dart';

class customlogoauth extends StatelessWidget {
  const customlogoauth({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(200)),
          width: 70,
          height: 70,
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Image.asset(
            "images/notes.png",
            width: 50,
            height: 50,
            fit: BoxFit.fill,
          )),
    );
  }
}
