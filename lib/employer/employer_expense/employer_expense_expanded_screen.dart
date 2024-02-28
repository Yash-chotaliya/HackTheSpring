import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hack_the_spring/components/employer_expense.dart';
import 'package:hack_the_spring/data%20models/employer_model.dart';

class EmployerExpenseExpandedScreen extends StatefulWidget{
  final EmployerExpenseModel employerExpenseModel;

  const EmployerExpenseExpandedScreen({
    super.key,
    required this.employerExpenseModel
  });

  @override
  State<EmployerExpenseExpandedScreen> createState() => _EmployerExpenseExpandedScreenState();
}

class _EmployerExpenseExpandedScreenState extends State<EmployerExpenseExpandedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/init_page_background.png")
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
                  Text(widget.employerExpenseModel.employeeId, style: TextStyle(color: Colors.white, fontSize: 25),),
                  const SizedBox(width: 25,)
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  color: Colors.white,
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/expense_photo.png",width: 250,fit: BoxFit.fill),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 130,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Date :", style: const TextStyle(fontSize: 12),),
                                  const SizedBox(height: 3,),
                                  Text(widget.employerExpenseModel.time.substring(6), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                  const SizedBox(height: 2,)
                                ],
                              ),
                            ),
                            Container(
                              width: 130,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Time :", style: const TextStyle(fontSize: 12),),
                                  const SizedBox(height: 3,),
                                  Text(widget.employerExpenseModel.time.substring(0,6), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                  const SizedBox(height: 2,)
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 130,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Vehicle Number :", style: const TextStyle(fontSize: 12),),
                                  const SizedBox(height: 3,),
                                  Text(widget.employerExpenseModel.vehicleNumber, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                  const SizedBox(height: 2,)
                                ],
                              ),
                            ),
                            Container(
                              width: 130,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Amount :", style: const TextStyle(fontSize: 12),),
                                  const SizedBox(height: 3,),
                                  Text("₹ ${widget.employerExpenseModel.amount}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                  const SizedBox(height: 2,)
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: double.maxFinite,
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Purpose :", style: const TextStyle(fontSize: 12),),
                              const SizedBox(height: 3,),
                              Text(widget.employerExpenseModel.purpose, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),maxLines: null,),
                              const SizedBox(height: 2,)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            statusUpdateBar()
          ],
        ),
      ),
    );
  }

  Widget statusUpdateBar() {
    if(widget.employerExpenseModel.status=="Pending"){
      return Container(
        padding: EdgeInsets.only(bottom: 10, top: 10),
        color: Color(0xFF3b72ff),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                approveExpense();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 40)
              ),
              child: const Text("Approve",style: TextStyle(color: Colors.green, fontSize: 15)),
            ),
            ElevatedButton(
              onPressed: () {
                rejectExpense();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 40)
              ),
              child: const Text("Reject",style: TextStyle(color: Colors.red, fontSize: 15)),
            )
          ],
        ),
      );
    }
    return Container();
  }

  Future<void> approveExpense() async {
    await FirebaseFirestore.instance.collection("Employee Petrol Expense").doc(widget.employerExpenseModel.employeeId).collection("History").doc(widget.employerExpenseModel.expenseId).update(
      {
        "status": "Accepted"
      }
    ).then((value) async {
      await FirebaseFirestore.instance.collection("Employer Petrol Expense").doc(widget.employerExpenseModel.expenseId).update(
        {
          "status": "Accepted"
        }
      ).then((value){
        Navigator.pop(context);
      }).catchError((onError){
        print(onError.toString());
      });
    }).catchError((error){
      print(error.toString());
    });
  }

  Future<void> rejectExpense() async {
    await FirebaseFirestore.instance.collection("Employee Petrol Expense").doc(widget.employerExpenseModel.employeeId).collection("History").doc(widget.employerExpenseModel.expenseId).update(
        {
          "status": "Rejected"
        }
    ).then((value){
      FirebaseFirestore.instance.collection("Employee Petrol Expense").doc(widget.employerExpenseModel.expenseId).update(
        {
          "status": "Rejected"
        }
      ).then((value){
        Navigator.pop(context);
      }).catchError((onError){
        print(onError.toString());
      });
    }).catchError((error){
      print(error.toString());
    });
  }
}