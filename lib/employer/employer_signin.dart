
import 'package:flutter/material.dart';
import 'package:hack_the_spring/employee/employee_signin.dart';
import 'package:hack_the_spring/employer/employer_main_screen.dart';
import 'package:hack_the_spring/employer/employer_signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/auth/auth_button.dart';
import '../components/auth/auth_textfield.dart';

class EmployerSignIn extends StatefulWidget{
  const EmployerSignIn({super.key});

  @override
  State<EmployerSignIn> createState() => _EmployerSignInState();
}

class _EmployerSignInState extends State<EmployerSignIn> {

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
                      Container(
                        width: 100,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 2.0, color: Colors.black)
                        ),
                        child: const Text("Admin",style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                      ),

                      const SizedBox(width: 50,),

                      InkWell(
                          onTap: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const EmployeeSignIn()));
                          },

                          child: const Text("Employee", style: TextStyle(color: Colors.black, fontSize: 15),)),



                    ],
                  ),
                  const SizedBox(height: 50,),
                  AuthTextField(hint: "Employer Id", controller: employeeIdController, keyboardType: TextInputType.text, prefixIcon: const Icon(Icons.person),suffixIcon: null,),
                  AuthTextField(hint: "Password", controller: passwordController, keyboardType: TextInputType.visiblePassword, prefixIcon: const Icon(Icons.lock), suffixIcon: const Icon(Icons.visibility),),
                  const SizedBox(height: 20,),
                  Text(errorMessage, style: const TextStyle(color: Colors.red),)
                ],
              ),
              Container(
                width: double.maxFinite,
                margin: const EdgeInsets.only(bottom: 80, left: 50, right: 50),
                child : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AuthButton(
                        onTap: (){
                           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const EmployerMainScreen(employerId: "", name: "")));
                        },
                        btnTxt: "SIGN IN"
                    ),Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? ",style: TextStyle(color:Color(0x77212121), fontSize: 15,),),
                        InkWell(
                            onTap: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const EmployerSignUp()));
                            },
                            child: const Text("SIGN UP",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),))



                      ],
                    )
                   
                  ],
                )


              )

            ],
          ),
        )
    );
  }

  Future<void> savePref(var employeeId, var name) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("employeeId", employeeId);
    prefs.setString("name", name);
    prefs.setBool("islogin", true);
  }
}