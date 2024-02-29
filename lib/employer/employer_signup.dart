
import 'package:flutter/material.dart';
import 'package:hack_the_spring/employer/employer_signin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/auth/auth_button.dart';
import '../components/auth/auth_textfield.dart';

class EmployerSignUp extends StatefulWidget{
  const EmployerSignUp({super.key});

  @override
  State<EmployerSignUp> createState() => _EmployerSignUpState();
}

class _EmployerSignUpState extends State<EmployerSignUp> {

  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/init_page_background.png")
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(top: 20, right: 30, left: 30),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Getting Started", style: TextStyle(color: Colors.black, fontSize: 20,),),
                      Text("Create an account to continue!", style: TextStyle(color: Color(0x77212121), fontSize: 12),)
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      const SizedBox(height: 15,),
                      AuthTextField(hint: "Email", controller: emailController, keyboardType: TextInputType.emailAddress, prefixIcon: const Icon(Icons.email),suffixIcon: null,),
                      AuthTextField(hint: "Username", controller: usernameController, keyboardType: TextInputType.text, prefixIcon: const Icon(Icons.person),suffixIcon: null,),
                      AuthTextField(hint: "Password", controller: passwordController, keyboardType: TextInputType.visiblePassword, prefixIcon: const Icon(Icons.lock), suffixIcon: const Icon(Icons.visibility),),
                      const SizedBox(height: 5,),
                      Text(errorMessage, style: const TextStyle(color: Colors.red),)
                    ],
                  ),
                ),
                Container(
                    width: double.maxFinite,
                    margin: const EdgeInsets.only(bottom: 20, left: 50, right: 50),
                    child : Column(
                      children: [
                        AuthButton(
                            onTap: (){

                            },
                            btnTxt: "SIGN UP"
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account? ",style: TextStyle(color: Color(0x77212121), fontSize: 13,),),
                            InkWell(
                                onTap: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const EmployerSignIn()));
                                },
                                child: const Text("SIGN IN",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),)),
                          ],
                        )
                      ],
                    )
                )
              ],
            ),
          )
      ),
    );
  }

  Future<void> savePref(var employeeId, var name) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("employeeId", employeeId);
    prefs.setString("name", name);
    prefs.setBool("islogin", true);
  }
}