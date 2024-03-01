import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../components/auth/auth_color.dart';
import '../../data models/employee_model.dart';

class EmployerSalaryExpandedScreen extends StatefulWidget{
  final String employeeId;

  const EmployerSalaryExpandedScreen({
    super.key,
    required this.employeeId
  });

  @override
  State<EmployerSalaryExpandedScreen> createState() => _EmployerSalaryExpandedScreenState();
}

class _EmployerSalaryExpandedScreenState extends State<EmployerSalaryExpandedScreen> {

  EmployeeSalaryModel employeeSalaryModel = EmployeeSalaryModel(salaryId: "0", allowance: 0, basicSalary: 0, bonus: 0, ctc: 0, deduction: 0, inHand: 0, month: "0", year: 0, status: "", expense: 0);
  var ctcController = TextEditingController();
  var basicSalaryController = TextEditingController();
  var allowanceController = TextEditingController();
  var expenseController = TextEditingController();
  var bonusController = TextEditingController();
  var deductionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getEmployeeSalary();
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
                    const Text("Salary", style: TextStyle(color: Colors.white, fontSize: 25),),
                    const SizedBox(width: 25,)
                  ],
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                child: Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: 200,
                            alignment: Alignment.center,
                            child: Text("${employeeSalaryModel.month}     ${employeeSalaryModel.year}", style: const TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold))
                        ),
                        SingleChildScrollView(
                          child: SizedBox(
                            width: 300,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const SizedBox(
                                    width: 100,
                                    child: Text("CTC : "),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    controller: ctcController,
                                    cursorColor: Colors.black,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                                      hintText: "₹ ${employeeSalaryModel.ctc}",
                                      hintStyle: TextStyle(color: AuthColor().textFieldHintTextColor,fontSize: 15),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const SizedBox(
                                  width: 100,
                                  child: Text("Basic Salary : "),
                              ),
                              SizedBox(
                                width: 100,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: basicSalaryController,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                                    hintText: "₹ ${employeeSalaryModel.basicSalary}",
                                    hintStyle: TextStyle(color: AuthColor().textFieldHintTextColor,fontSize: 15),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const SizedBox(
                                  width: 100,
                                  child: Text("Allowance : "),
                              ),
                              SizedBox(
                                width: 100,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: allowanceController,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                                    hintText: "₹ ${employeeSalaryModel.allowance}",
                                    hintStyle: TextStyle(color: AuthColor().textFieldHintTextColor,fontSize: 15),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const SizedBox(
                                  width: 100,
                                  child: Text("Expense : "),
                              ),
                              SizedBox(
                                width: 100,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: expenseController,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                                    hintText: "₹ ${employeeSalaryModel.expense}",
                                    hintStyle: TextStyle(color: AuthColor().textFieldHintTextColor,fontSize: 15),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const SizedBox(
                                  width: 100,
                                  child: Text("Bonus : "),
                              ),
                              SizedBox(
                                width: 100,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: bonusController,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                                    hintText: "₹ ${employeeSalaryModel.bonus}",
                                    hintStyle: TextStyle(color: AuthColor().textFieldHintTextColor,fontSize: 15),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const SizedBox(
                                  width: 100,
                                  child: Text("Deduction : "),
                              ),
                              SizedBox(
                                width: 100,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: deductionController,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                                    hintText: "₹ ${employeeSalaryModel.deduction}",
                                    hintStyle: TextStyle(color: AuthColor().textFieldHintTextColor,fontSize: 15),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20,),
                        InkWell(
                          onTap: (){
                            updateSalary();
                          },
                          child: Container(
                            width: 100,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: const Text("Save", style: TextStyle(color: Colors.white, fontSize: 17),),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),

      ),
    );
  }

  Future<void> getEmployeeSalary() async {
    await FirebaseFirestore.instance.collection("Employee Salary").doc(widget.employeeId).get().then((docSnapShot){
      setState(() {
        employeeSalaryModel = EmployeeSalaryModel(
            salaryId: docSnapShot.get("salaryId"),
            allowance: docSnapShot.get("allowance"),
            basicSalary: docSnapShot.get("basicSalary"),
            bonus: docSnapShot.get("bonus"),
            ctc: docSnapShot.get("ctc"),
            deduction: docSnapShot.get("deduction"),
            inHand: docSnapShot.get("inHand"),
            month: docSnapShot.get("month"),
            year: docSnapShot.get("year"),
            status: docSnapShot.get("status"),
            expense: docSnapShot.get("expense"));
      });
    }).catchError((error){
      print(error.toString());
    });
  }

  statusColor() {
    if(employeeSalaryModel.status=="Paid") {
      return Colors.green;
    }
    return Colors.red;
  }

  Future<void> updateSalary() async {
    print(allowanceController.text);

    await FirebaseFirestore.instance.collection("Employee Salary").doc(widget.employeeId).set(
      EmployeeSalaryModel(
          salaryId: employeeSalaryModel.salaryId,
          allowance: isNumberChanged(allowanceController.text, employeeSalaryModel.allowance),
          basicSalary: isNumberChanged(basicSalaryController.text, employeeSalaryModel.basicSalary),
          bonus: isNumberChanged(bonusController.text, employeeSalaryModel.bonus),
          ctc: isNumberChanged(ctcController.text, employeeSalaryModel.ctc),
          deduction: isNumberChanged(deductionController.text, employeeSalaryModel.deduction),
          inHand: employeeSalaryModel.inHand,
          month: employeeSalaryModel.month,
          year: employeeSalaryModel.year,
          status: employeeSalaryModel.status,
          expense: isNumberChanged(expenseController.text, employeeSalaryModel.expense)
      ).toMap()
    ).then((value){
      Navigator.pop(context);
    }).catchError((onError){
      print(onError.toString());
    });
  }

  int isNumberChanged(String x, int y){
    if(x==""){
      return y;
    }
    return int.parse(x);
  }
}