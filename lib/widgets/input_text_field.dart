// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class inputTextField extends StatelessWidget {
  const inputTextField({
    Key? key,
    required this.hintText,
    required this.myController,
  }) : super(key: key);

  final String hintText;
  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 3, color: Colors.white),
          borderRadius: BorderRadius.circular(50.0),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: 20.0, color: Color.fromARGB(255, 255, 255, 255)),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
          ),
        ),
        filled: true,
        fillColor: Color.fromARGB(255, 0, 26, 44),
      ),
      controller: myController,
      obscureText: true,
    );
  }
}
