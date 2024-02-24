import 'package:flutter/material.dart';

class EmployeeProfileText extends StatelessWidget{
  final String hint;
  final String text;
  final Widget icon;

  const EmployeeProfileText({
    super.key,
    required this.hint,
    required this.text,
    required this. icon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hint,style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
          const SizedBox(height: 5,),
          Row(
            children: [
              icon,
              const SizedBox(width: 10,),
              Text(
                text,style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),

              ),
            ],
          ),
        ],
      ),
    );
  }

}