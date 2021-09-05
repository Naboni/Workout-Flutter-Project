import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  final String labelText;
  final String hintText;
  Field(
    this.labelText,
    this.hintText,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              bottom: 3,
            ),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hintText,
            hintStyle: TextStyle(
                fontSize: 16,
                // fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
    );
  }
}
