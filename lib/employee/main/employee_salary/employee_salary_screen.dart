import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hack_the_spring/components/employee_salary.dart';
import 'package:hack_the_spring/data%20models/employee_model.dart';


class EmployeeSalaryScreen extends StatefulWidget{
  final String employeeId;
  final EmployeeSalaryModel currentSalary;

  const EmployeeSalaryScreen({
    super.key,
    required this.employeeId,
    required this.currentSalary
  });

  @override
  State<EmployeeSalaryScreen> createState() => _EmployeeSalaryScreenState();
}

class _EmployeeSalaryScreenState extends State<EmployeeSalaryScreen> {
  List<EmployeeSalaryModel> employeeSalaryList = [];

  @override
  void initState() {
    super.initState();
    getEmployeeSalary();
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
                  image: AssetImage("assets/images/init_page_background.png"),
                )
            ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.maxFinite,
                decoration: const BoxDecoration(
                    color: Color(0xFF3b72ff),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50))
                ),
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: const Icon(Icons.keyboard_backspace,size: 25, color: Colors.white,),
                      onTap: (){
                        Navigator.pop(context);
                      },
                    ),
                    const Text("Salary", style: TextStyle(color: Colors.white, fontSize: 25),),
                    const SizedBox(width: 25,)
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: employeeSalaryList.length,
                  itemBuilder: (context, index) {
                    return listItemLay(context,index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listItemLay(BuildContext context,int index){
    return EmployeeSalaryCard(employeeSalaryModel: employeeSalaryList[index]);
  }

  void getEmployeeSalary() {
    FirebaseFirestore.instance.collection("Employee Salary").doc(widget.employeeId).collection("History").get().then((docSnapShot){
      for (var doc in docSnapShot.docs){
        setState(() {
          employeeSalaryList.insert(0, EmployeeSalaryModel(
              salaryId: doc.get("salaryId"),
              allowance: doc.get("allowance"),
              basicSalary: doc.get("basicSalary"),
              bonus: doc.get("bonus"),
              ctc: doc.get("ctc"),
              deduction: doc.get("deduction"),
              inHand: doc.get("inHand"),
              month: doc.get("month"),
              year: doc.get("year"),
              status: doc.get("status"),
              expense: doc.get("expense")
          ));
        });
      }
      setState(() {
        employeeSalaryList.insert(0, widget.currentSalary);
      });
    }).catchError((onError){
      print(onError.toString());
    });
  }
}