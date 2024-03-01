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
  List<EmployeeDetailsModel> filterEmployeeList = [];
  var searchControler = TextEditingController();

  @override
  void initState() {
    super.initState();
    getAllEmployees();
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
                child: Column(
                  children: [
                    Row(
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
                    const SizedBox(height: 10), // Add some space between the "Employees" text and the search field
                    TextField( // Add your new search field here
                      controller: searchControler,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Search...',
                        hintStyle: const TextStyle(color: Colors.black),
                        prefixIcon: const Icon(Icons.search, color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      style: const TextStyle(color: Colors.black),
                      onChanged: (value) {
                       filterEmployees(value);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: filterEmployeeList.length,
                  itemBuilder: (context, index) {
                    return listItemLay(context,index);
                  },
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }

  Widget listItemLay(BuildContext context, int index) {
    return EmployerSalaryCard(employeeModel: filterEmployeeList[index],);
  }

  Future<void> getAllEmployees() async {
    employeeDetailsList.clear();
    searchControler.clear();

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
    filterEmployeeList = List.from(employeeDetailsList);
  }
  void filterEmployees(String searchText) {
    setState(() {
      filterEmployeeList = employeeDetailsList.where((employee) {
        final name = employee.name.toLowerCase();
        final id = employee.employeeId.toLowerCase();
        final searchLower = searchText.toLowerCase();
        return name.contains(searchLower) || id.contains(searchLower);
      }).toList();
    });
  }
}