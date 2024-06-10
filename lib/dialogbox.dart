import 'package:flutter/material.dart';
import 'package:todoapp/myButton.dart';

class Dialogbox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  Dialogbox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFFF2FFFA),
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new Task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                Mybutton(name: "Save", onPressed: onSave),

                SizedBox(
                  width: 10,
                ),

                //cancel Button
                Mybutton(name: "Cancel", onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
