import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../data models/employee_model.dart';
import '../employer/employer_salary/employer_salary_expanded_screen.dart';

class EmployerSalaryCard extends StatefulWidget{
  final EmployeeDetailsModel employeeModel;

  const EmployerSalaryCard({
    super.key,
    required this.employeeModel
  });

  @override
  State<EmployerSalaryCard> createState() => _EmployerSalaryCardState();
}

class _EmployerSalaryCardState extends State<EmployerSalaryCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> EmployerSalaryExpandedScreen(employeeId: widget.employeeModel.employeeId)));
      },
      child: Card(
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
                    Text(widget.employeeModel.name),
                    Text(widget.employeeModel.employeeId)
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                changeSalaryStatus();
              },
              child: Container(
                margin: const EdgeInsets.only(right: 30),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: statusColor(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(widget.employeeModel.salaryStatus, style: const TextStyle(color: Colors.white, fontSize: 12),),
              ),
            ),
          ],
        )
        ,

      ),
    );
  }

  statusColor() {
    if(widget.employeeModel.salaryStatus=="Pending") {
      return Colors.red;
    }
    return Colors.green;
  }

  Future<void> changeSalaryStatus() async {
    if(widget.employeeModel.salaryStatus=="Pending"){
      await FirebaseFirestore.instance.collection("Employee Salary").doc(widget.employeeModel.employeeId).update(
          {
            "status": "Paid"
          }
      ).then((value) async {
        await FirebaseFirestore.instance.collection("Employees").doc(widget.employeeModel.employeeId).update(
          {
            "salaryStatus":"Paid"
          }
        ).then((value){

          // setState(() {
          //   widget.employeeModel.salaryStatus="Paid";
          // });
        }).catchError((error){
          print(error.toString());
        });
      }).catchError((onError){
        print(onError.toString());
      });
    }
    else{
      await FirebaseFirestore.instance.collection("Employee Salary").doc(widget.employeeModel.employeeId).update(
          {
            "status": "Pending"
          }
      ).then((value){
        print("pending");
        FirebaseFirestore.instance.collection("Employees").doc(widget.employeeModel.employeeId).update(
          {
            "salaryStatus": "Pending"
          }
        ).then((value){

          // setState(() {
          //   widget.employeeModel.salaryStatus="Pending";
          // });
        }).catchError((error){
          print(error.toString());
        });
      }).catchError((onError){
        print(onError.toString());
      });
    }

  }
}