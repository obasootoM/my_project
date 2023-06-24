import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hinText;
  final int maxLine;
  const CustomTextField({super.key,
    required this.controller,
    this.maxLine = 1,
    required this.hinText});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hinText,
          border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12
          )
        )
      ),
      validator: (val) {
          if (val == null || val.isEmpty) {
            return 'Form cannot be empty $hinText';
          }
          return null;
      },
      maxLines: maxLine,
    );
  }
}
