import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hack_the_spring/components/employer_employee.dart';
import 'package:hack_the_spring/data%20models/employee_model.dart';
import 'package:image_picker/image_picker.dart';

class EmployerAddEmployeeScreen extends StatefulWidget{
  const EmployerAddEmployeeScreen({super.key});

  @override
  State<EmployerAddEmployeeScreen> createState() => _EmployerAddEmployeeScreenState();
}

class _EmployerAddEmployeeScreenState extends State<EmployerAddEmployeeScreen> {
  File? _image;
  final picker = ImagePicker();

  var emailController = TextEditingController();
  var mobileNumberController = TextEditingController();
  var nameController = TextEditingController();
  var basicSalaryController = TextEditingController();
  var ctcController = TextEditingController();
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
          alignment: Alignment.center,
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
                    child: EmployerAddEmployeeTextField(
                      hint: 'Name',
                      controller: nameController,
                      inputType: TextInputType.text,
                      prefixIcon: const Icon(Icons.person_2_outlined),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: EmployerAddEmployeeTextField(
                      hint: 'Email',
                      controller: emailController,
                      inputType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email_outlined),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: EmployerAddEmployeeTextField(
                      hint: 'Mobile Number',
                      controller: mobileNumberController,
                      inputType: TextInputType.number,
                      prefixIcon: const Icon(Icons.phone)
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: EmployerAddEmployeeTextField(
                      hint: 'Basic Salary',
                      controller: basicSalaryController,
                      inputType: TextInputType.number,
                      prefixIcon: const Icon(Icons.currency_rupee),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: EmployerAddEmployeeTextField(
                      hint: 'CTC',
                      controller: ctcController,
                      inputType: TextInputType.number,
                      prefixIcon: const Icon(Icons.currency_rupee),
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
                            addEmployee();
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
                  ),

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
    nameController.clear();
    emailController.clear();
    mobileNumberController.clear();
  }

  Future<void> addEmployee() async {
    today = DateTime.now();
    var employeeId = getEmployeeId();
    var salaryId = getSalaryId(employeeId);
    await FirebaseFirestore.instance.collection("Employees").doc(employeeId).set(
        EmployeeDetailsModel(
            employeeId: employeeId,
            email: emailController.text,
            lastlogin: "",
            mobileNumber: mobileNumberController.text,
            name: nameController.text,
            photo: "",
            password: employeeId,
            salaryStatus: "Pending"
        ).toMap()
    ).then((value){
      FirebaseFirestore.instance.collection("Employee Salary").doc(employeeId).set(
        EmployeeSalaryModel(
            salaryId: salaryId,
            allowance: 0,
            basicSalary: int.parse(basicSalaryController.text),
            bonus: 0,
            ctc: int.parse(ctcController.text),
            deduction: 0,
            inHand: int.parse(basicSalaryController.text),
            month: today.month.toString(),
            year: today.year,
            status: "Pending",
            expense: 0
        ).toMap()
      ).then((value){
        Navigator.pop(context);
      }).catchError((onError){
        print(onError.toString());
      });
    }).catchError((error){
      print(error.toString());
    });
  }

  String getEmployeeId() {
    var x = today.year % 100;
    return "$x${today.month}${today.day}${today.hour}${today.minute}${today.second}";
  }

  String getSalaryId(String employeeId) {
    return  "$employeeId${today.month}${today.year}1";
  }

  void albumCapture() {

  }
}