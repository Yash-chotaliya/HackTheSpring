import 'package:flutter/material.dart';
import 'package:hack_the_spring/components/custom_button.dart';
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
                CustomTextField(hint: "Employee Id", controller: userIdController, keyboardType: TextInputType.text, prefixIcon: const Icon(Icons.person),suffixIcon: null,),
                CustomTextField(hint: "Password", controller: passwordController, keyboardType: TextInputType.visiblePassword, prefixIcon: const Icon(Icons.lock), suffixIcon: const Icon(Icons.visibility),)
              ],
            ),
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.only(bottom: 80, left: 50, right: 50),
              child: CustomButton(
                  onTap: (){

                  },
                  btnTxt: "SIGN IN"
              ),
            )
          ],
        ),
      )
    );
  }
}