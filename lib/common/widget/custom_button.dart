import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String hinText;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.hinText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 40)
        ),
        child: Text(hinText));

  }
}
