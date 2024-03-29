import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hack_the_spring/data%20models/employee_model.dart';
import 'package:hack_the_spring/employer/employer_signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/employee_profile.dart';

class EmployerProfileScreen extends StatefulWidget{
  final String employerId;

  const EmployerProfileScreen({
    super.key,
    required this.employerId
  });

  @override
  State<EmployerProfileScreen> createState() => _EmployerProfileScreenState();
}

class _EmployerProfileScreenState extends State<EmployerProfileScreen> {

  EmployeeDetailsModel employeeDetails = EmployeeDetailsModel(employeeId: "", email: "", lastlogin: "", mobileNumber: "", name: "", photo: "", password: '', salaryStatus: "");

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
                image: AssetImage("assets/images/employee_profile_background.png"),
              )
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: const Icon(Icons.keyboard_backspace,size: 25, color: Colors.white,),
                        onTap: (){
                          Navigator.pop(context);
                        },
                      ),
                      const Text("My Profile", style: TextStyle(color: Colors.white, fontSize: 25),),
                      const SizedBox(width: 25,)
                    ],
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 60),
                      child: Card(
                        color: Colors.white,
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        elevation: 10,
                        child: Column(
                          children: [
                            const SizedBox(height: 40,),
                            Text(employeeDetails.name, style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                            const SizedBox(height: 10,),
                            const Text("Employer's Role",style: TextStyle(color: Colors.black, fontSize: 15)),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {

                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 40)
                                  ),
                                  child: const Text("Edit Profile",style: TextStyle(color: Colors.white, fontSize: 13)),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    signOutemployer();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 40)
                                  ),
                                  child: const Text("Log Out",style: TextStyle(color: Colors.white, fontSize: 13)),
                                )
                              ],
                            ),
                            const SizedBox(height: 10,)
                          ],
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(bottom: 120),
                        width: 70,
                        height: 70,
                        child: Image.asset("assets/images/profile_image.png",fit: BoxFit.fill,)
                    )
                  ],
                ),
                Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(top: 10),
                  child: Card(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    elevation: 10,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EmployeeProfileText(hint: 'Email', text: employeeDetails.email, icon: const Icon(Icons.email_outlined),),
                        EmployeeProfileText(hint: 'Mobile Number', text: employeeDetails.mobileNumber, icon: const Icon(Icons.phone),),
                        EmployeeProfileText(hint: 'Employee Id', text: employeeDetails.employeeId, icon: const Icon(Icons.person),),
                        EmployeeProfileText(hint: 'last Login', text: employeeDetails.lastlogin, icon: const Icon(Icons.calendar_month),),
                        const SizedBox(height: 20,)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  //  getEmployeeDetails();
  }

  void getEmployeeDetails(){
    FirebaseFirestore.instance.collection("Employees").doc(widget.employerId).get().then((details){
      setState(() {
        employeeDetails = EmployeeDetailsModel(
            email: details.get("email"),
            employeeId: details.get("employee Id"),
            lastlogin: details.get("lastlogin"),
            mobileNumber: details.get("mobile number"),
            name: details.get("name"),
            photo: details.get("photo"),
            password: details.get("password"),
            salaryStatus: details.get("salaryStatus")
        );
      });
    });
  }

  Future<void> signOutemployer() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("islogin", false);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const EmployerSignIn()), (route) => false);
  }
}