import 'package:flutter/material.dart';
import 'package:hack_the_spring/employee/main/employee_salary/employee_salary_expanded_screen.dart';

import '../data models/employee_model.dart';

class EmployeeSalaryCard extends StatelessWidget{
  final EmployeeSalaryModel employeeSalaryModel;

  const EmployeeSalaryCard({
    super.key,
    required this.employeeSalaryModel
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    width: 350,
    child: Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> EmployeeSalaryExpandedScreen(employeeSalaryModel: employeeSalaryModel,)));
          },
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("${employeeSalaryModel.month} ${employeeSalaryModel.year}", style: const TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold)),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5,),
                              Text("Salary :",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15, )),
                              SizedBox(height: 5,),
                              Text("Expense :",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15, )),
                              SizedBox(height: 5,),
                              Text("Deduction :",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15, )),
                              SizedBox(height: 5,),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5,),
                            Text("₹ ${employeeSalaryModel.basicSalary}",style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15, )),
                            const SizedBox(height: 5,),
                            Text("₹ ${employeeSalaryModel.expense}",style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15, )),
                            const SizedBox(height: 5,),
                            Text("₹ ${employeeSalaryModel.deduction}",style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15, )),
                            const SizedBox(height: 5,),
                          ],
                        ),
                      ],
                    ),
                    Container(
                        margin: const EdgeInsets.only(bottom: 40),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: statusColor(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(employeeSalaryModel.status, style: const TextStyle(color: Colors.white, fontSize: 12),),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
  }

  statusColor() {
    if(employeeSalaryModel.status=="Paid") {
      return Colors.green;
    }
    return Colors.red;
  }
}