import 'package:flutter/material.dart';
import 'package:hack_the_spring/components/auth/auth_color.dart';

class AuthTextField extends StatelessWidget{
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const AuthTextField({
    super.key,
    required this.hint,
    required this.controller,
    required this.keyboardType,
    required this.prefixIcon,
    required this.suffixIcon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        cursorColor: Colors.black,
        style: TextStyle(color: AuthColor().textFieldTxtColor, fontSize: 15),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 2,
            ),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 3,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          hintText: hint,
          hintStyle: TextStyle(color: AuthColor().textFieldHintTextColor,fontSize: 15),
        ),
      ),
    );
  }

}