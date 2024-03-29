import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hack_the_spring/components/employee_recent_activity.dart';
import 'package:hack_the_spring/components/employee_salary.dart';
import 'package:hack_the_spring/data%20models/employee_model.dart';
import 'employee_advance/employee_advance_screen.dart';
import 'employee_dashboard/employee_dashboard_screen.dart';
import 'employee_expense/employee_expense_screen.dart';
import 'employee_profile/employee_profile_screen.dart';
import 'employee_recent_activity/employee_recent_activity_screen.dart';
import 'employee_salary/employee_salary_screen.dart';

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
  List<EmployeeRecentActivityModel> employeeRecentActivityList = [];

  @override
  void initState() {
    super.initState();
    getEmployeeSalary();
    getEmployeeRecentActivities();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                margin: const EdgeInsets.only(top: 30),
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeSalaryScreen(employeeId: widget.employeeId, currentSalary: employeeSalaryList[0],)));
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
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Card(
                        color: Colors.white,
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
                                        Image.asset("assets/images/dashboard_icon.png"),
                                        const SizedBox(height: 5,),
                                        const Text("Dashboard", style: TextStyle(color: Color(0xFF98c6f1),fontSize: 15),)
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeAdvanceScreen(employeeId: widget.employeeId,)));
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
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeExpenseScreen(employeeId: widget.employeeId,)));
                                    },
                                    child: Column(
                                      children: [
                                        Image.asset("assets/images/expense_icon.png"),
                                        const SizedBox(height: 5),
                                        const Text("Expense",style: TextStyle(color: Color(0xFFc498f1),fontSize: 15))
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color: const Color(0xFFFFFFFF),
                        margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                        child: Column(
                          children: [
                            Container(
                              width: double.maxFinite,
                              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Recent Activities", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                                  InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> EmployeeRecentActivityScreen(employeeRecentActivityList: employeeRecentActivityList,)));
                                      },
                                      child: const Text("View All", style: TextStyle(color: Colors.black, fontSize: 15),)
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10,),
                            getLatestActivity(0),
                            getLatestActivity(1),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF3b72ff),
          onPressed: (){
            getEmployeeRecentActivities();
            getEmployeeSalary();
          },
          child: const Icon(Icons.refresh, color: Colors.white,),
        ),
      ),
    );
  }

  Future<void> getEmployeeSalary() async {
    employeeSalaryList.clear();

    await FirebaseFirestore.instance.collection("Employee Salary").doc(widget.employeeId).get().then((docSnapShot){
      setState(() {
        employeeSalaryList.insert(0,EmployeeSalaryModel(
            salaryId: docSnapShot.get("salaryId"),
            allowance: docSnapShot.get("allowance"),
            basicSalary: docSnapShot.get("basicSalary"),
            bonus: docSnapShot.get("bonus"),
            ctc: docSnapShot.get("ctc"),
            deduction: docSnapShot.get("deduction"),
            inHand: docSnapShot.get("inHand"),
            month: docSnapShot.get("month"),
            year: docSnapShot.get("year"),
            status: docSnapShot.get("status"),
            expense: docSnapShot.get("expense")));
      });
    }).catchError((error){
      print(error.toString());
    });
  }

  Future<void> getEmployeeRecentActivities() async {
    employeeRecentActivityList.clear();

    await FirebaseFirestore.instance.collection("Employee Recent Activity").doc(widget.employeeId).collection("History").get().then((docSnapShot){
      for (var doc in docSnapShot.docs){
        setState(() {
          employeeRecentActivityList.insert(0,EmployeeRecentActivityModel(
          activityId: doc.get("activityId"),
          time: doc.get("time"),
          feature: doc.get("feature"),
          status: doc.get("status")));
        });
      }
    }).catchError((error){
      print(error.toString());
    });
  }

  getLatestSalary(int index) {
    if(employeeSalaryList.isNotEmpty) {
      return EmployeeSalaryCard(employeeSalaryModel: employeeSalaryList[index]);
    }
    return Container();
  }

  getLatestActivity(int index){
    if(employeeRecentActivityList.length>index){
      return EmployeeRecentActivity(employeeRecentActivityModel: employeeRecentActivityList[index],);
    }
    return Container();

  }
}