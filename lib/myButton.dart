import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final String name;
  VoidCallback onPressed;
  Mybutton({super.key, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Color(0xFF69F7A6),
      child: Text(name),
    );
  }
}
