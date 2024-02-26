import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hack_the_spring/employee/main/employee_expense/employee_add_expense_screen.dart';

import '../../../components/employee_expense.dart';
import '../../../data models/employee_model.dart';

class EmployeeExpenseScreen extends StatefulWidget{
  final String employeeId;

  const EmployeeExpenseScreen({
    super.key,
    required this.employeeId
  });

  @override
  State<EmployeeExpenseScreen> createState() => _EmployeeExpenseScreenState();
}

class _EmployeeExpenseScreenState extends State<EmployeeExpenseScreen> {

  List<EmployeeExpenseModel> employeeExpenseList = [];

  @override
  void initState() {
    super.initState();
    getEmployeeExpense();
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
                  color: Color(0xFF9b51e0),
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
                  const Text("Expense", style: TextStyle(color: Colors.white, fontSize: 25),),
                  const SizedBox(width: 25,)
                ],
              ),
            ),
            Container(
              height: 610,
              margin: const EdgeInsets.only(bottom: 50),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF9b51e0),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> EmployeeAddExpenseScreen(employeeId: widget.employeeId)));
        },
        child: Icon(Icons.add, color: Colors.white,),
      ),
    );
  }

  Widget listItemLay(BuildContext context,int index){
    return EmployeeExpenseCard(employeeExpenseModel: employeeExpenseList[index],);
  }

  Future<void> getEmployeeExpense() async {
    await FirebaseFirestore.instance.collection("Employee Petrol Expense").doc(widget.employeeId).collection("History").get().then((docSnapShot){
      for (var doc in docSnapShot.docs){
        setState(() {
          employeeExpenseList.insert(0, EmployeeExpenseModel(
              amount: doc.get("amount"),
              purpose: doc.get("purpose"),
              photo: doc.get("photo"),
              status: doc.get("status"),
              time: doc.get("time"),
              vehicleNumber: doc.get("vehicleNumber")
          ));
        });
      }
    });
  }
}