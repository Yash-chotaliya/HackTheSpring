import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data models/employer_model.dart';
import 'employee_advance.dart';

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

class EmployerAdvanceCard extends StatelessWidget{
  final EmployerAdvanceModel employerAdvanceModel;

  const EmployerAdvanceCard({
    super.key,
    required this.employerAdvanceModel
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Card(
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(left: 10, right: 10, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/advance_icon.png", height: 70),
                    SizedBox(height: 5,),
                    Text(employerAdvanceModel.issuedDate.substring(0,6), style: TextStyle(color: Color(0xFF6C6C6C))),
                    SizedBox(height: 5,)
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 5),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Id : ${employerAdvanceModel.employeeId}", style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 8,),
                      Text("Amount ₹ ${employerAdvanceModel.amount}", style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 8,),
                      EmployeeAdvanceText(
                          hint: "Purpose",
                          text: employerAdvanceModel.purpose
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, right: 10, left: 10),
                child: Text(employerAdvanceModel.issuedDate.substring(6), style: TextStyle(color: Color(0xFF6C6C6C))),
              )
            ],
          ),
        )
    );
  }

}