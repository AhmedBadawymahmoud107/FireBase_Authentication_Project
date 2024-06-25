import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class customlisttile extends StatelessWidget {
  final String name;

  final String email;

  final String date;

  final String image;

  const customlisttile(
      {super.key,
      required this.name,
      required this.email,
      required this.date,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                height: 70,
                width: 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(70),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text("$name"),
                  subtitle: Text("$email"),
                  trailing: Text("$date"),
                ),
              )
            ],
          ),
        ));
  }
}
