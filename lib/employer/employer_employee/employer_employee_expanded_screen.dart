import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hack_the_spring/data%20models/employee_model.dart';
import 'package:hack_the_spring/employee/main/employee_dashboard/employee_dashboard_screen.dart';

import '../../components/employee_profile.dart';
import '../../employee/main/employee_advance/employee_advance_screen.dart';
import '../../employee/main/employee_expense/employee_expense_screen.dart';
import '../../employee/main/employee_salary/employee_salary_screen.dart';

class EmployerEmployeeExpandedScreen extends StatefulWidget{
  final EmployeeDetailsModel employeeDetailsModel;
  const EmployerEmployeeExpandedScreen({
    super.key,
    required this.employeeDetailsModel
  });

  @override
  State<EmployerEmployeeExpandedScreen> createState() => _EmployerEmployeeExpandedScreenState();
}

class _EmployerEmployeeExpandedScreenState extends State<EmployerEmployeeExpandedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/employee_profile_background.png"),
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.only(top: 50),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: const Icon(Icons.keyboard_backspace,size: 25, color: Colors.white,),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                  Text(widget.employeeDetailsModel.name, style: TextStyle(color: Colors.white, fontSize: 25),),
                  const SizedBox(width: 25,)
                ],
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(top: 50),
                  child: Card(
                    color: Colors.white,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 40,),
                        Text(widget.employeeDetailsModel.employeeId, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Container(
                          width: double.maxFinite,
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: 10),
                            child: Text("Email : ${widget.employeeDetailsModel.email}", style: TextStyle(color: Colors.black),)
                        ),
                        SizedBox(height: 10,),
                        Container(
                            width: double.maxFinite,
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: 10),
                            child: Text("Contact : ${widget.employeeDetailsModel.mobileNumber}", style: TextStyle(color: Colors.black))
                        ),
                        SizedBox(height: 10,)
                      ],
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(bottom: 80),
                    width: 70,
                    height: 70,
                    child: Image.asset("assets/images/profile_image.png",fit: BoxFit.fill,)
                )
              ],
            ),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){

                      },
                      child: Column(
                        children: [
                          Image.asset("assets/images/dashboard_icon.png", height: 45,),
                          const SizedBox(height: 5,),
                          const Text("Dashboard", style: TextStyle(color: Color(0xFF98c6f1),fontSize: 15),)
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){

                      },
                      child: Column(
                        children: [
                          Image.asset("assets/images/salaryIcon.png", height: 45,),
                          const SizedBox(height: 5),
                          const Text("Salary",style: TextStyle(color: Color(0xffd61717),fontSize: 15))
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){

                      },
                      child: Column(
                        children: [
                          Image.asset("assets/images/advance_icon.png", height: 45,),
                          const SizedBox(height: 5),
                          const Text("Advance",style: TextStyle(color: Color(0xff03ab00),fontSize: 15))
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){

                      },
                      child: Column(
                        children: [
                          Image.asset("assets/images/expense_icon.png", height: 45,),
                          const SizedBox(height: 5),
                          const Text("Expense",style: TextStyle(color: Color(0xFFc498f1),fontSize: 15))
                        ],
                      ),
                    ),
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}