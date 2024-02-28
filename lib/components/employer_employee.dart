import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hack_the_spring/data%20models/employee_model.dart';

class EmployerAddEmployeeTextField extends StatelessWidget{
  final String hint;
  final TextEditingController controller;
  final TextInputType inputType;
  final Icon? prefixIcon;

  const EmployerAddEmployeeTextField({
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

class EmployerEmployeeCard extends StatelessWidget{
  final EmployeeDetailsModel employeeDetailsModel;

  const EmployerEmployeeCard({
    super.key,
    required this.employeeDetailsModel
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Container(
            height: 50,
              width: 50,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Image.asset("assets/images/profile_image.png"),
           ),
          Expanded(
            child: Container(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                     Text(employeeDetailsModel.name),
                     Text(employeeDetailsModel.employeeId)
                ],
              ),
            ),
          ),
          Container(
            child: Icon(Icons.keyboard_arrow_right_outlined),
          ),
        ],
      )
      ,

    );
  }

}