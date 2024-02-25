import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hack_the_spring/components/employee_salary.dart';
import 'package:hack_the_spring/data%20models/employee_model.dart';
import 'package:hack_the_spring/employee/main/employee_profile/employee_profile_screen.dart';
import 'package:hack_the_spring/employee/main/employee_salary/employee_salary_screen.dart';

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

  List<EmployeeSalaryModel> employeeSalaryList = [];

  @override
  void initState() {
    super.initState();
    getEmployeeSalary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/employee_main_background.png"),
          )
        ),
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.only(top: 40),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Hello,\n${widget.name}", style: const TextStyle(color: Colors.white, fontSize: 20)),
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
              )
            ),
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Container(
                      width: double.maxFinite,
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeSalaryScreen(employeeSalaryList: employeeSalaryList,)));
                        },
                          child: const Text("View All", style: TextStyle(color: Colors.white),)
                      ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        getLatestSalary(0),
                        getLatestSalary(1)
                      ],
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

  Future<void> getEmployeeSalary() async {
    await FirebaseFirestore.instance.collection("Employee Salary").doc(widget.employeeId).collection("History").get().then((docSnapShot){
      for (var doc in docSnapShot.docs){
        setState(() {
          employeeSalaryList.insert(0,EmployeeSalaryModel(
              salaryId: doc.get("salaryId"),
              allowance: doc.get("allowance"),
              basicSalary: doc.get("basicSalary"),
              bonus: doc.get("bonus"),
              ctc: doc.get("ctc"),
              deduction: doc.get("deduction"),
              inHand: doc.get("inHand"),
              daysLeft: doc.get("daysLeft"),
              month: doc.get("month"),
              year: doc.get("year"),
              status: doc.get("status"),
              expense: doc.get("expense")));
        });
      }
    });
  }

  getLatestSalary(int index) {
    if(employeeSalaryList.isNotEmpty)
      return EmployeeSalaryMainCard(employeeSalaryModel: employeeSalaryList[index]);
    return Container();
  }
}