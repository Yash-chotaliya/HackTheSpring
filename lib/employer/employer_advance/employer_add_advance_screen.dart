import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hack_the_spring/data%20models/employer_model.dart';
import '../../components/employer_advance.dart';
import '../../data models/employee_model.dart';


class EmployerAddAdvanceScreen extends StatefulWidget{
  const EmployerAddAdvanceScreen({super.key});

  @override
  State<EmployerAddAdvanceScreen> createState() => _EmployerAddAdvanceScreenState();
}

class _EmployerAddAdvanceScreenState extends State<EmployerAddAdvanceScreen> {

  List<String> employeeName = [];
  String? dropdownValue;
  String? employeeId;
  var amountController = TextEditingController();
  var purposeController = TextEditingController();
  late DateTime today;


  @override
  void initState() {
    super.initState();
    getEmployeeID();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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

                    Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 10, bottom: 5),
                          child: Text("Employee Id", style: const TextStyle(color: Colors.white),),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),

                          ),
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: DropdownButton<String>(

                            hint: Text('Select ID'),
                            value: dropdownValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                                employeeId = newValue.split(" ")[0];
                              });
                            },
                            items: employeeName.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                child: Text(value),
                                value: value,
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: EmployerAddAdvancedTextField(
                        hint: 'Amount',
                        controller: amountController,
                        inputType: TextInputType.number,
                        prefixIcon: const Icon(Icons.currency_rupee),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: EmployerAddAdvancedTextField(
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
                              addAdvance();
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
      ),
    );
  }

  Future<void> addAdvance() async {
    var currentTime = getCurrentTime();
    var advanceId = getAdvanceId();
    await FirebaseFirestore.instance.collection("Employee Advance").doc(employeeId).collection("History").doc(advanceId).set(
        EmployeeAdvanceModel(
            advanceId: advanceId,
            amount: int.parse(amountController.text),
            purpose: purposeController.text,
            issuedDate: currentTime
        ).toMap()
    ).then((value) async {
      await FirebaseFirestore.instance.collection("Employer Advance").doc(advanceId).set(
        EmployerAdvanceModel(
            employeeId: employeeId!,
            advanceId: advanceId,
            amount: int.parse(amountController.text),
            purpose: purposeController.text,
            issuedDate: currentTime
        ).toMap()
      ).then((value) async {
        await FirebaseFirestore.instance.collection("Employee Recent Activity").doc(employeeId).collection("History").doc(getActivityId()).set(
            EmployeeRecentActivityModel(
                activityId: getActivityId(),
                time: currentTime,
                feature: "Advance",
                status: "Added"
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
  }

  String getCurrentTime() {
    today = DateTime.now();
    return "${today.hour}:${today.minute}  ${today.day}-${today.month}-${today.year}";
  }

  getAdvanceId() {
    var x = today.year%100;
    return "$employeeId${today.hour}${today.minute}${today.month}${x}3";
  }

  getActivityId() {
    var x = today.year%100;
    return "$employeeId${today.hour}${today.minute}${today.month}${x}4";
  }

  void resetData() {
    amountController.clear();
    purposeController.clear();
  }
  void getEmployeeID() async {
    await FirebaseFirestore.instance.collection("Employees").get().then((docSnapShot) {
      for (var doc in docSnapShot.docs){
        setState(() {
          employeeName.insert(0, doc.get("employeeId")+"     "+doc.get("name"));

        });
      }
    }).catchError((onError){
      print(onError.toString());
    });
  }
}