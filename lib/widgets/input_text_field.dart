import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputTextFormField extends StatelessWidget {
  const InputTextFormField({
    Key? key,
    required this.minLines,
    required this.hintText,
  }) : super(key: key);

  final int minLines;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        minLines: minLines,
        maxLines: 40,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.white),
            borderRadius: BorderRadius.circular(5.0),
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
      ),
    );
  }
}
