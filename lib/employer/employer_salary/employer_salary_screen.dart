import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hack_the_spring/components/employer_salary.dart';

import '../../data models/employee_model.dart';

class EmployerSalaryScreen extends StatefulWidget{
  const EmployerSalaryScreen({super.key});

  @override
  State<EmployerSalaryScreen> createState() => _EmployerSalaryScreenState();
}

class _EmployerSalaryScreenState extends State<EmployerSalaryScreen> {

  List<EmployeeDetailsModel> employeeDetailsList = [];


  @override
  void initState() {
    super.initState();
    getAllEmployees();
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
                  const Text("Salary", style: TextStyle(color: Colors.white, fontSize: 25),),
                  InkWell(
                    child: const Icon(Icons.refresh,size: 25, color: Colors.white,),
                    onTap: (){
                      getAllEmployees();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: employeeDetailsList.length,
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

  Widget listItemLay(BuildContext context, int index) {
    return EmployerSalaryCard(employeeModel: employeeDetailsList[index],);
  }

  Future<void> getAllEmployees() async {
    employeeDetailsList.clear();

    await FirebaseFirestore.instance.collection("Employees").get().then((docSnapShot){
      for(var doc in docSnapShot.docs){
        setState(() {
          employeeDetailsList.insert(0, EmployeeDetailsModel(
              employeeId: doc.get("employeeId"),
              email: doc.get("email"),
              lastlogin: doc.get("lastlogin"),
              mobileNumber: doc.get("mobileNumber"),
              name: doc.get("name"),
              photo: doc.get("photo"),
              password: doc.get("password"),
              salaryStatus: doc.get("salaryStatus")));
        });
      }

    }).catchError((error){
      print(error.toString());
    });
  }
}