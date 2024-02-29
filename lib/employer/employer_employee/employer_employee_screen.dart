import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hack_the_spring/components/employer_employee.dart';

import '../../data models/employee_model.dart';
import 'employer_add_employee_screen.dart';

class EmployerEmployeeScreen extends StatefulWidget{
  const EmployerEmployeeScreen({super.key});

  @override
  State<EmployerEmployeeScreen> createState() => _EmployerEmployeeScreenState();
}

class _EmployerEmployeeScreenState extends State<EmployerEmployeeScreen> {
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
        child:  Column(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        child: const Icon(Icons.keyboard_backspace,size: 25, color: Colors.white,),
                        onTap: (){
                          Navigator.pop(context);
                        },
                      ),
                      const Text("Employees", style: TextStyle(color: Colors.white, fontSize: 25),),
                      const SizedBox(width: 25,),
                    ],
                  ),
                  const SizedBox(height: 10), // Add some space between the "Employees" text and the search field
                  TextField( // Add your new search field here
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
                      // Implement search functionality here
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF3b72ff),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const EmployerAddEmployeeScreen()));
        },
        child: const Icon(Icons.add, color: Colors.white,),
      ),);
  }

  Future<void> getAllEmployees() async {
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

  Widget listItemLay(BuildContext context, int index) {
    return EmployerEmployeeCard(employeeDetailsModel: employeeDetailsList[index]);
  }
}


