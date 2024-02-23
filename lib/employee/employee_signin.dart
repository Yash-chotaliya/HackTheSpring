import 'package:flutter/material.dart';
import 'package:hack_the_spring/components/custom_button.dart';
import 'package:hack_the_spring/components/custom_color.dart';
import 'package:hack_the_spring/components/custom_textfield.dart';

class EmployeeSignIn extends StatefulWidget{
  const EmployeeSignIn({super.key});

  @override
  State<EmployeeSignIn> createState() => _EmployeeSignInState();
}

class _EmployeeSignInState extends State<EmployeeSignIn> {

  var userIdController = TextEditingController();
  var passwordController = TextEditingController();
  var errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: CustomColor().authBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.only(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue,
                            offset: Offset(2.0, 2.0),
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20))
                    ),
                    margin: const EdgeInsets.only(top: 10, bottom: 10, right: 200),
                    alignment: AlignmentDirectional.center,
                    width: 200,
                    child: const Text("Admin", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue,
                            offset: Offset(2.0, 2.0),
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))
                    ),
                    margin: const EdgeInsets.only(top: 10, bottom: 10, left: 200),
                    alignment: AlignmentDirectional.center,
                    width: 200,
                    child: const Text("Employee", style: TextStyle(color: Colors.blue, fontSize: 30, fontWeight: FontWeight.w700),),
                  )
                ],
              ),
            ),
            Card(
              elevation: 10,
              surfaceTintColor: CustomColor().authBackgroundColor,
              color: CustomColor().authBackgroundColor,
              shadowColor: Colors.blue,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white, width: 5),
                borderRadius: BorderRadius.circular(40),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                          color: Color(0xFF1089D3),
                          fontSize: 30,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                  CustomTextField(hint: "User Id", controller: userIdController, keyboardType: TextInputType.text),
                  CustomTextField(hint: "Password", controller: passwordController, keyboardType: TextInputType.text),
                  Container(
                      width: double.maxFinite,
                      margin: const EdgeInsets.only(top: 1,left: 25, right: 25),
                      child: InkWell(
                        onTap: (){

                        },
                          child: const Text("Forget Password ?", style: TextStyle(color: Colors.blue, fontSize: 13))
                      ),
                  ),
                  CustomButton(
                      onTap: (){

                      },
                      btnTxt: "Sign In"
                  ),
                  Text(errorMessage,style: TextStyle(fontSize: 13, color: Colors.red)),
                  SizedBox(height: 10)
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 100,
              color: CustomColor().authBackgroundColor,
            )
          ],
        ),
      )
    );
  }
}