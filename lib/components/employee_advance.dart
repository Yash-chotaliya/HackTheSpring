import 'package:flutter/material.dart';
import '../data models/employee_model.dart';

class EmployeeAdvanceCard extends StatelessWidget{
  final EmployeeAdvanceModel employeeAdvanceModel;

  const EmployeeAdvanceCard({
    super.key,
    required this.employeeAdvanceModel
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
                    Text(employeeAdvanceModel.issuedDate.substring(0,6), style: TextStyle(color: Color(0xFF6C6C6C))),
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
                      Text("Amount ₹ ${employeeAdvanceModel.amount}", style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 8,),
                      EmployeeAdvanceText(
                          hint: "Purpose",
                          text: employeeAdvanceModel.purpose
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, right: 10, left: 10),
                child: Text(employeeAdvanceModel.issuedDate.substring(6), style: TextStyle(color: Color(0xFF6C6C6C))),
              )
            ],
          ),
        )
    );
  }
}

class EmployeeAdvanceText extends StatelessWidget{
  final String hint;
  final String text;

  const EmployeeAdvanceText({
    super.key,
    required this.hint,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Colors.black,
                  width: 1
              )
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$hint :", style: const TextStyle(fontSize: 12),),
          Text(text, style: const TextStyle(fontWeight: FontWeight.bold),),
          const SizedBox(height: 2,)
        ],
      ),
    );
  }

}