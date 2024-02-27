import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/employee_advance.dart';
import '../../../data models/employee_model.dart';

class EmployeeAdvanceScreen extends StatefulWidget{
  final String employeeId;

  const EmployeeAdvanceScreen({
    super.key,
    required this.employeeId
  });

  @override
  State<EmployeeAdvanceScreen> createState() => _EmployeeAdvanceScreenState();
}

class _EmployeeAdvanceScreenState extends State<EmployeeAdvanceScreen> {

  List<EmployeeAdvanceModel> employeeAdvanceList = [];

  @override
  void initState() {
    super.initState();
    getEmployeeAdvance();
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
                  const Text("Advance", style: TextStyle(color: Colors.white, fontSize: 25),),
                  const SizedBox(width: 25,)
                ],
              ),
            ),
            Container(
              height: 610,
              margin: const EdgeInsets.only(bottom: 50),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: employeeAdvanceList.length,
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

  Widget listItemLay(BuildContext context,int index){
    return EmployeeAdvanceCard(employeeAdvanceModel: employeeAdvanceList[index],);
  }

  Future<void> getEmployeeAdvance() async {
    await FirebaseFirestore.instance.collection("Employee Advance").doc(widget.employeeId).collection("History").get().then((docSnapShot){
      for (var doc in docSnapShot.docs){
        setState(() {
          employeeAdvanceList.insert(0, EmployeeAdvanceModel(
              advanceId: doc.get("advanceId"),
              amount: doc.get("amount"),
              purpose: doc.get("purpose"),
              issuedDate: doc.get("issuedDate")
          ));
        });
      }
    });
  }
}