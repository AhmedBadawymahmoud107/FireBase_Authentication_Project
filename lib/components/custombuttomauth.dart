import 'package:flutter/material.dart';

class custombuttomauth extends StatelessWidget {
  const custombuttomauth({super.key, required this.Title, this.onPressed});

  final String Title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 40,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: onPressed,
      child: Text(
        "$Title",
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.orange,
    );
  }
}
