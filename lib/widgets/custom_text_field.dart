import 'package:flutter/material.dart';
import 'package:getx_app/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.hintText,
    this.icon,
    this.keyboardType,
    this.autocorrect = false,
    this.autofocus = false,
    this.obscureText = false,
    this.onChanged,
  }) : super(key: key);
  final String? hintText;
  final IconData? icon;
  final TextInputType? keyboardType;
  final bool autocorrect;
  final bool autofocus;
  final bool obscureText;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            spreadRadius: 5.0,
            offset: const Offset(1, 1),
            color: Colors.grey.withOpacity(0.3),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText ?? '',
          prefixIcon: Icon(
            icon,
            color: primaryColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide.none,
          ),
          fillColor: Colors.white,
          filled: true,
        ),
        keyboardType: keyboardType,
        cursorHeight: cursorHeight,
        cursorColor: primaryColor,
        autocorrect: autocorrect,
        autofocus: autofocus,
        onChanged: onChanged,
        obscureText: obscureText,
      ),
    );
  }
}
