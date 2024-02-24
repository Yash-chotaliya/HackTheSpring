import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/auth/auth_button.dart';
import '../components/auth/auth_textfield.dart';
import 'main/employee_main_screen.dart';

class EmployeeSignIn extends StatefulWidget{
  const EmployeeSignIn({super.key});

  @override
  State<EmployeeSignIn> createState() => _EmployeeSignInState();
}

class _EmployeeSignInState extends State<EmployeeSignIn> {

  var employeeIdController = TextEditingController();
  var passwordController = TextEditingController();
  var errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/init_page_background.png")
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.only(top: 70, right: 30, left: 30),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Let's Sign You In", style: TextStyle(color: Colors.black, fontSize: 20,),),
                  Text("Welcome back, you've been missed!", style: TextStyle(color: Color(0x77212121), fontSize: 12),)
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Admin", style: TextStyle(color: Colors.black, fontSize: 15),),
                    const SizedBox(width: 50,),
                    Container(
                      width: 100,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2.0, color: Colors.black)
                      ),
                      child: const Text("Employee",style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
                const SizedBox(height: 50,),
                AuthTextField(hint: "Employee Id", controller: employeeIdController, keyboardType: TextInputType.text, prefixIcon: const Icon(Icons.person),suffixIcon: null,),
                AuthTextField(hint: "Password", controller: passwordController, keyboardType: TextInputType.visiblePassword, prefixIcon: const Icon(Icons.lock), suffixIcon: const Icon(Icons.visibility),),
                SizedBox(height: 20,),
                Text(errorMessage, style: TextStyle(color: Colors.red),)
              ],
            ),
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.only(bottom: 80, left: 50, right: 50),
              child: AuthButton(
                  onTap: (){
                      signInEmployee();
                    },
                  btnTxt: "SIGN IN"
              ),
            )
          ],
        ),
      )
    );
  }

  void signInEmployee(){
    String employeeId = employeeIdController.text.toString();
    String password = passwordController.text.toString();

    FirebaseFirestore.instance.collection("Employees").get().then((employees) {
      for (var employee in employees.docs){
        if((employee.get("employee Id").toString()==employeeId) && (employee.get("password").toString()==password)){
          savePref(employeeId, employee.get("name").toString());
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmployeeMainScreen(employeeId: employeeId, name: employee.get("name").toString(),)));
          return;
        }
      }
    });
  }

  Future<void> savePref(var employeeId, var name) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("employeeId", employeeId);
    prefs.setString("name", name);
    prefs.setBool("islogin", true);
  }
}