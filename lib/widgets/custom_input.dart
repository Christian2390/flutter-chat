import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;

  const CustomInput({
    super.key,
    required this.icon,
    required this.placeholder,
    required this.textController,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6, left: 6, bottom: 6, right: 24),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.amber.shade100,
        borderRadius: BorderRadius.circular(30),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            offset: Offset(0, 6),
            blurRadius: 6,
          ),
        ],
      ),
      child: TextField(
        controller: textController,
        autocorrect: false,
        keyboardType: keyboardType,
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: placeholder,
        ),
      ),
    );
  }
}
