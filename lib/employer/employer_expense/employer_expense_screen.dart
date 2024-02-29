import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../components/employer_expense.dart';
import '../../data models/employer_model.dart';

class EmployerExpenseScreen extends StatefulWidget{
  const EmployerExpenseScreen({super.key});

  @override
  State<EmployerExpenseScreen> createState() => _EmployerExpenseScreenState();
}

class _EmployerExpenseScreenState extends State<EmployerExpenseScreen> {

  List<EmployerExpenseModel> employerExpenseList = [];


  @override
  void initState() {
    super.initState();
    getExpenses();
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
                image: AssetImage("assets/images/init_page_background.png")
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
                  InkWell(
                    child: const Icon(Icons.refresh,size: 25, color: Colors.white,),
                    onTap: (){
                      getExpenses();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: employerExpenseList.length,
                itemBuilder: (context, index) {
                  return listItemLay(context,index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getExpenses() async {
    employerExpenseList.clear();

    await FirebaseFirestore.instance.collection("Employer Petrol Expense").get().then((docSnapShot){
      for( var doc in docSnapShot.docs){
        setState(() {
          employerExpenseList.insert(0, EmployerExpenseModel(
            employeeId: doc.get("employeeId"),
            expenseId: doc.get("expenseId"),
            amount: doc.get("amount"),
            purpose: doc.get("purpose"),
            photo: doc.get("photo"),
            status: doc.get("status"),
            time: doc.get("time"),
            vehicleNumber: doc.get("vehicleNumber"),
          ));
        });
      }
    }).catchError((error){
      print(error.toString());
    });
  }

  Widget listItemLay(BuildContext context, int index) {
    return EmployerExpenseCard(employerExpenseModel: employerExpenseList[index],);
  }
}