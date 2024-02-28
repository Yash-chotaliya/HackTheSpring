import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmployerAddAdvancedTextField extends StatelessWidget{
  final String hint;
  final TextEditingController controller;
  final TextInputType inputType;
  final Icon? prefixIcon;

  const EmployerAddAdvancedTextField({
    super.key,
    required this.hint,
    required this.controller,
    required this.inputType,
    required this.prefixIcon
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 10, bottom: 5),
          child: Text(hint, style: const TextStyle(color: Colors.white),),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            controller: controller,
            keyboardType: inputType,
            cursorColor: Colors.black,
            maxLines: null,
            style: TextStyle(fontSize: 18, color: Colors.black),
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
            ),
          ),
        )
      ],
    );
  }
}