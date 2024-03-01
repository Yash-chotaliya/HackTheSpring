import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../components/employee_expense.dart';
import '../../../data models/employee_model.dart';


class EmployerEmployeeExpenseScreen extends StatefulWidget{
  final String employeeId;

  const EmployerEmployeeExpenseScreen({
    super.key,
    required this.employeeId
  });

  @override
  State<EmployerEmployeeExpenseScreen> createState() => _EmployerEmployeeExpenseScreenState();
}

class _EmployerEmployeeExpenseScreenState extends State<EmployerEmployeeExpenseScreen> {

  List<EmployeeExpenseModel> employeeExpenseList = [];

  @override
  void initState() {
    super.initState();
    getEmployeeExpense();
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
            mainAxisSize: MainAxisSize.max,
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
                    const Text("Expense", style: TextStyle(color: Colors.white, fontSize: 25),),
                    InkWell(
                      child: const Icon(Icons.refresh,size: 25, color: Colors.white,),
                      onTap: (){
                        getEmployeeExpense();
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: employeeExpenseList.length,
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
    return EmployeeExpenseCard(employeeExpenseModel: employeeExpenseList[index],);
  }

  Future<void> getEmployeeExpense() async {
    employeeExpenseList.clear();

    await FirebaseFirestore.instance.collection("Employee Petrol Expense").doc(widget.employeeId).collection("History").get().then((docSnapShot){
      for (var doc in docSnapShot.docs){
        setState(() {
          employeeExpenseList.insert(0, EmployeeExpenseModel(
              amount: doc.get("amount"),
              purpose: doc.get("purpose"),
              rejectedReason: doc.get("rejectedReason"),
              photo: doc.get("photo"),
              status: doc.get("status"),
              time: doc.get("time"),
              vehicleNumber: doc.get("vehicleNumber"),
              expenseId: doc.get("expenseId")
          ));
        });
      }
    });
  }
}