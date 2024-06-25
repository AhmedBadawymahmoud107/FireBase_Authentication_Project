import 'package:flutter/material.dart';

class customtextform extends StatelessWidget {
  final String hinttext;

  final TextEditingController mycontroler;

  const customtextform(
      {super.key, required this.hinttext, required this.mycontroler});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mycontroler,
      decoration: InputDecoration(
          hintText: hinttext,
          helperStyle: TextStyle(color: Colors.grey, fontSize: 14),
          contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.grey),
          )),
    );
  }
}
