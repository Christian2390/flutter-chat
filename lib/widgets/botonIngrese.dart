import 'package:flutter/material.dart';

class BotonIngrese extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const BotonIngrese({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.brown.shade900,
        elevation: 5,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.amber,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
