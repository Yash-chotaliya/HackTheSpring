import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hack_the_spring/components/employee_expense.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data models/employee_model.dart';
import '../../../data models/employer_model.dart';

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
  File? _image;
  final picker = ImagePicker();

  var amountController = TextEditingController();
  var vehicleNumberController = TextEditingController();
  var purposeController = TextEditingController();
  late DateTime today;

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
                                      cameraCapture();
                                    },
                                  ),
                                  const VerticalDivider(color: Colors.black,width: 10,),
                                  InkWell(
                                      onTap: (){
                                        albumCapture();
                                      },
                                      child: const Icon(Icons.folder, color: Colors.black,size: 60,)
                                  )
                                ],
                              ),
                            ),
                            Visibility(
                              visible: _image==null ? false : true,
                              child: Container(
                                width: double.maxFinite,
                                padding: const EdgeInsets.all(8.0),
                                child: _image==null ? Image.asset("assets/images/profile_image.png", fit: BoxFit.fill,): Image.file(_image!, fit: BoxFit.fitWidth,),
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

  Future cameraCapture() async {
    final pickerImage = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if(pickerImage!=null){
        _image = File(pickerImage.path);
      }
    });
  }

  void resetData() {
    amountController.clear();
    vehicleNumberController.clear();
    purposeController.clear();

  }

  Future<void> addExpense() async {
    var currentTime = getCurrentTime();
    var expenseId = getExpenseId();
    final storageRef = FirebaseStorage.instanceFor(bucket: "gs://hackthespring-6dc73.appspot.com").ref();

    final mountainsRef = storageRef.child("expensePhoto/${widget.employeeId}/$expenseId.jpg");
    try {
      await mountainsRef.putFile(_image!).then((p0) async {
        p0.ref.getDownloadURL().then((value) async {
          var imageURL = value;
          await FirebaseFirestore.instance.collection("Employee Petrol Expense").doc(widget.employeeId).collection("History").doc(expenseId).set(
              EmployeeExpenseModel(
                  amount: int.parse(amountController.text),
                  purpose: purposeController.text,
                  photo: imageURL,
                  status: "Pending",
                  time: currentTime,
                  vehicleNumber: vehicleNumberController.text,
                  expenseId: expenseId
              ).toMap()
          ).then((value) async {
            await FirebaseFirestore.instance.collection("Employer Petrol Expense").doc(expenseId).set(
                EmployerExpenseModel(
                    employeeId: widget.employeeId,
                    expenseId: expenseId,
                    amount: int.parse(amountController.text),
                    purpose: purposeController.text,
                    photo: imageURL,
                    status: "Pending",
                    time: currentTime,
                    vehicleNumber: vehicleNumberController.text
                ).toMap()
            ).then((value) async {
              await FirebaseFirestore.instance.collection("Employee Recent Activity").doc(widget.employeeId).collection("History").doc(getActivityId()).set(
                  EmployeeRecentActivityModel(
                      activityId: getActivityId(),
                      time: currentTime,
                      feature: "Expense",
                      status: "Pending"
                  ).toMap()
              ).then((value){
                Navigator.pop(context);
              }).catchError((e){
                print(e.toString());
              });
            }).catchError((error){
              print(error.toString());
            });
          }).catchError((onError){
            print(onError.toString());
          });
        });

      });
    }catch (e) {
      print(e.toString());
    };

  }

  void albumCapture() {

  }

  String getCurrentTime() {
    today = DateTime.now();
    return "${today.hour}:${today.minute}  ${today.day}-${today.month}-${today.year}";
  }

  getExpenseId() {
    var x = today.year%100;
    return "${widget.employeeId}${today.hour}${today.minute}${today.month}${x}2";
  }

  getActivityId() {
    var x = today.year%100;
    return "${widget.employeeId}${today.hour}${today.minute}${today.month}${x}4";
  }


}