import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hack_the_spring/components/employee_expense.dart';
import 'package:hack_the_spring/data%20models/employee_model.dart';

class EmployeeAddExpenseScreen extends StatefulWidget{
  final String employeeId;

  const EmployeeAddExpenseScreen({
    super.key,
    required this.employeeId
  });

  @override
  State<EmployeeAddExpenseScreen> createState() => _EmployeeAddExpenseScreenState();
}

class _EmployeeAddExpenseScreenState extends State<EmployeeAddExpenseScreen> {

  var amountController = TextEditingController();
  var vehicleNumberController = TextEditingController();
  var purposeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        height: double.maxFinite,
        width: double.maxFinite,
        child: Card(
          color: const Color(0xFF3b72ff),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Container(
                  width: double.maxFinite,
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.close,
                        color: Colors.white,)
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 120,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    child: const Icon(Icons.camera_alt, color: Colors.black,size: 60,),
                                    onTap: (){

                                    },
                                  ),
                                  const VerticalDivider(color: Colors.black,width: 10,),
                                  InkWell(
                                      onTap: (){

                                      },
                                      child: const Icon(Icons.folder, color: Colors.black,size: 60,)
                                  )
                                ],
                              ),
                            ),
                            Visibility(
                              visible: false,
                              child: Container(
                                width: double.maxFinite,
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/images/profile_image.png", fit: BoxFit.fitWidth,),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Text("Upload Image Of Bill"),
                      const SizedBox(height: 10,)
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: EmployeeAddExpenseTextField(
                    hint: 'Amount',
                    controller: amountController,
                    inputType: TextInputType.number,
                    prefixIcon: const Icon(Icons.currency_rupee),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: EmployeeAddExpenseTextField(
                    hint: 'Vehicle Number',
                    controller: vehicleNumberController,
                    inputType: TextInputType.text,
                    prefixIcon: const Icon(Icons.motorcycle_sharp),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: EmployeeAddExpenseTextField(
                    hint: 'Purpose',
                    controller: purposeController,
                    inputType: TextInputType.text,
                    prefixIcon: null,
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(bottom: 20, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          addExpense();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff0d0080),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.only(right: 10),
                          alignment: Alignment.center,
                          width: 120,
                          height: 40,
                          child: const Text("Add", style: TextStyle(color: Colors.white, fontSize: 20),),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          resetData();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.only(left: 10),
                          alignment: Alignment.center,
                          width: 120,
                          height: 40,
                          child: const Text("Reset", style: TextStyle(color: Colors.white, fontSize: 20),),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }

  void resetData() {
    amountController.clear();
    vehicleNumberController.clear();
    purposeController.clear();

  }

  Future<void> addExpense() async {
    await FirebaseFirestore.instance.collection("Employee Petrol Expense").doc(widget.employeeId).collection("History").add(
      EmployeeExpenseModel(
          amount: int.parse(amountController.text),
          purpose: purposeController.text,
          photo: "",
          status: "Pending",
          time: getCurrentTime(),
          vehicleNumber: vehicleNumberController.text
      ).toMap()
    ).then((value){
      Navigator.pop(context);
    }).catchError((onError){
      print(onError.toString());
    });
  }

  String getCurrentTime() {
    DateTime today = DateTime.now();
    return "${today.hour}:${today.minute}  ${today.day}-${today.month}-${today.year}";
  }
}