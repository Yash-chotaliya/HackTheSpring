import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hack_the_spring/employee/main/employee_profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data models/Employee.dart';

class EmployeeMainScreen extends StatefulWidget{
  final String employeeId;
  final String name;

  const EmployeeMainScreen({
    super.key,
    required this.employeeId,
    required this.name
  });

  @override
  State<EmployeeMainScreen> createState() => _EmployeeMainScreenState();
}

class _EmployeeMainScreenState extends State<EmployeeMainScreen> {

  EmployeeDetails employeeDetails = EmployeeDetails(employeeId: "", email: "", lastlogin: "", mobileNumber: "", name: "", photo: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/employee_main_background.png"),
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(top: 40),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Hello,\n${employeeDetails.name}", style: TextStyle(color: Colors.black, fontSize: 20)),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeProfileScreen(employeeId: widget.employeeId,)));
                    },
                    child: CircleAvatar(
                      radius: 27,
                      child: Image.asset("assets/images/profile_image.png"),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getEmployeeDetails();
  }

  void getEmployeeDetails(){
    FirebaseFirestore.instance.collection("Employees").doc(widget.employeeId).get().then((details){
      setState(() {
        employeeDetails = EmployeeDetails(
            email: details.get("email"),
            employeeId: details.get("employee Id"),
            lastlogin: details.get("lastlogin"),
            mobileNumber: details.get("mobile number"),
            name: details.get("name"),
            photo: details.get("photo")
        );
      });
    });
  }
}