import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hack_the_spring/components/employee_salary.dart';
import 'package:hack_the_spring/data%20models/employee_model.dart';
import 'package:hack_the_spring/employee/main/employee_dashboard/employee_dashboard_screen.dart';
import 'package:hack_the_spring/employer/add_employee/add_employee_screen.dart';
import 'package:hack_the_spring/employer/employer_profile/employer_profile_screen.dart';
import 'package:hack_the_spring/employer/employer_salary/employer_salary_screen.dart';

import 'employer_advance/employer_advance_screen.dart';
import 'employer_dashboard/employer_dashboard_screen.dart';
import 'employer_expense/employer_expense_screen.dart';

// import 'employee_advance/employee_advance_screen.dart';

class EmployerMainScreen extends StatefulWidget{
  final String employerId;
  final String name;

  const EmployerMainScreen({
    super.key,
    required this.employerId,
    required this.name
  });

  @override
  State<EmployerMainScreen> createState() => _EmployerMainScreenState();
}

class _EmployerMainScreenState extends State<EmployerMainScreen> {

  List<EmployeeSalaryModel> employeeSalaryList = [];

  @override
  void initState() {
    super.initState();
    //getEmployeSalary();
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
                    const Text("Hello,\nSandip Majithiya", style: TextStyle(color: Colors.white, fontSize: 20)),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const EmployerProfileScreen(employerId: "")));
                      },
                      child: CircleAvatar(
                        radius: 27,
                        child: Image.asset("assets/images/profile_image.png"),
                      ),
                    )
                  ],
                )
            ),
           const SizedBox(height: 20),
            Card(
              color: const Color(0xFFFFFFFF),
              elevation: 10,
              margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      alignment: Alignment.centerLeft,
                      child: const Text("Features", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const EmployeeDashboardScreen()));
                          },
                          child: Column(
                            children: [
                              InkWell(
                                  onTap:(){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AddEmployeeScreen()));
                                    },
                                  child: Image.asset("assets/images/employeeIcon.png")),
                              const SizedBox(height: 5,),
                              const Text("Employee", style: TextStyle(color: Color(0xFF98c6f1),fontSize: 15,fontWeight:FontWeight.bold),)
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const EmployerAdvanceScreen()));
                          },
                          child: Column(
                            children: [
                              Image.asset("assets/images/advance_icon.png"),
                              const SizedBox(height: 5),
                              const Text("Advance",style: TextStyle(color: Color(0xff03ab00),fontSize: 15))
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const EmployerExpenseScreen()));
                          },
                          child: Column(
                            children: [
                              Image.asset("assets/images/expense_icon.png"),
                              const SizedBox(height: 5),
                              const Text("Expense",style: TextStyle(color: Color(0xFFc498f1),fontSize: 15,fontWeight:FontWeight.bold))
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const EmployerDashboardScreen()));
                          },
                          child: Column(
                            children: [
                              Image.asset("assets/images/dashboard_icon.png"),
                              const SizedBox(height: 5,),
                              const Text("DashBord", style: TextStyle(color: Color(0xFF98c6f1),fontSize: 15,fontWeight:FontWeight.bold),)
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const EmployerSalaryScreen()));
                          },
                          child: Column(
                            children: [
                              Image.asset("assets/images/salaryIcon.png"),
                              const SizedBox(height: 5),
                              const Text("Salary",style: TextStyle(color: Color(0xff9A1F1F),fontSize: 15,fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                        const SizedBox(width: 70,),

                      ],
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Future<void> getEmployeeSalary() async {
    await FirebaseFirestore.instance.collection("Employee Salary").doc(widget.employerId).collection("History").get().then((docSnapShot){
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
    if(employeeSalaryList.isNotEmpty) {
      return EmployeeSalaryCard(employeeSalaryModel: employeeSalaryList[index]);
    }
    return Container();
  }
}