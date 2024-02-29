import 'package:flutter/material.dart';
import 'package:hack_the_spring/main.dart';

import '../../../data models/employee_model.dart';

class EmployeeSalaryExpandedScreen extends StatefulWidget{
  final EmployeeSalaryModel employeeSalaryModel;

  const EmployeeSalaryExpandedScreen({
    super.key,
    required this.employeeSalaryModel
  });


  @override
  State<EmployeeSalaryExpandedScreen> createState() => _EmployeeSalaryExpandedScreenState();
}

class _EmployeeSalaryExpandedScreenState extends State<EmployeeSalaryExpandedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              padding: const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
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
            SizedBox(
              width: 350,
              child: Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("${widget.employeeSalaryModel.month} ${widget.employeeSalaryModel.year}", style: const TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold)),
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
                                      Text("Basic Salary :",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15, )),
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
                                    Text("₹ ${widget.employeeSalaryModel.basicSalary}",style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15, )),
                                    const SizedBox(height: 5,),
                                    Text("₹ ${widget.employeeSalaryModel.expense}",style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15, )),
                                    const SizedBox(height: 5,),
                                    Text("₹ ${widget.employeeSalaryModel.deduction}",style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15, )),
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
                              child: Text(widget.employeeSalaryModel.status, style: const TextStyle(color: Colors.white, fontSize: 12),),
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        height: 20,
                        thickness: 2,
                        indent: 20,
                        endIndent: 0,
                        color: Colors.black,
                      ),
                      Container(
                      margin:  const EdgeInsets.only(right: 20,left: 20),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                            Container(
                              margin: const EdgeInsets.only(right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5,),
                                  Text("Basic Salary :",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15, )),
                                  SizedBox(height: 5,),
                                  Text("Allowance :",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15, )),
                                  SizedBox(height: 5,),
                                  Text("Expence :",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15, )),
                                  SizedBox(height: 5,),
                                  Text("Bounce :",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15, )),
                                  SizedBox(height: 5,),
                                  Text("Deduction :",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15, )),
                                  SizedBox(height: 5,),
                                  Text("In Hand :",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15, )),
                                  SizedBox(height: 5,),

                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 5,),
                                  Text("₹ ${widget.employeeSalaryModel.basicSalary}",style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15, )),
                                  const SizedBox(height: 5,),
                                  Text("₹ ${widget.employeeSalaryModel.allowance}",style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15, )),
                                  const SizedBox(height: 5,),
                                  Text("₹ ${widget.employeeSalaryModel.expense}",style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15, )),
                                  const SizedBox(height: 5,),
                                  const SizedBox(height: 5,),
                                  Text("₹ ${widget.employeeSalaryModel.bonus}",style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15, )),
                                  const SizedBox(height: 5,),
                                  Text("₹ ${widget.employeeSalaryModel.deduction}",style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15, )),
                                  const SizedBox(height: 5,),
                                  Text("₹ ${widget.employeeSalaryModel.inHand}",style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15, )),
                                  const SizedBox(height: 5,),
                                ],
                              ),

                            )

                          ],

                      ),
                    ),

                    ],



                  ),


                ),
              ),

            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 40)
                    ),
                    child: const Text("PDF",style: TextStyle(color: Colors.white, fontSize: 13)),
                  ),
                ],
              ),
            ),



          ],
        ),
      ),
    );
  }

  statusColor() {
    if(widget.employeeSalaryModel.status=="Paid") {
      return Colors.green;
    }
    return Colors.red;
  }
}