import 'package:flutter/material.dart';
import '../../components/employer_advance.dart';

class EmployerAddAdvanceScreen extends StatefulWidget{
  const EmployerAddAdvanceScreen({super.key});

  @override
  State<EmployerAddAdvanceScreen> createState() => _EmployerAddAdvanceScreenState();
}

class _EmployerAddAdvanceScreenState extends State<EmployerAddAdvanceScreen> {
  var employeeIdController = TextEditingController();
  var amountController = TextEditingController();
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
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: EmployerAddAdvancedTextField(
                      hint: 'Employee_Id',
                      controller: employeeIdController,
                      inputType: TextInputType.text,
                      prefixIcon: const Icon(Icons.person_2_outlined),
                    ),
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
                            Navigator.pop(context);

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

                           // resetData();
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
}