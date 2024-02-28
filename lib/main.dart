import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hack_the_spring/employee/employee_signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'employee/main/employee_main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBFKwtnpLAXHO0yYunI3nMeeil5blZmw_k", // paste your api key here
      appId: "1:519305744992:android:0bb77ccd83625cfe4e2905", //paste your app id here
      messagingSenderId: "519305744992", //paste your messagingSenderId here
      projectId: "hackthespring-6dc73", //paste your project id here
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hack The Spring',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const LandingPage1(),
    );
  }
}

class LandingPage1 extends StatefulWidget{
  const LandingPage1({super.key});

  @override
  State<LandingPage1> createState() => _LandingPage1State();
}

class _LandingPage1State extends State<LandingPage1> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/init_page_background.png")
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50,),
                Text("Seamlessly Manage\nYour Salary",style: TextStyle(color: Colors.black,fontSize: 27),textAlign: TextAlign.center, ),
                SizedBox(height: 20,),
                Text("Discover the revolutionary semi automated\nsalary management experience.",style: TextStyle(color: Color(0x77212121),fontSize: 15),textAlign: TextAlign.center, ),
                SizedBox(height: 50,),
              ],
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const EmployeeSignIn()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2d4b89),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
                child: const Text("Get Started", style: TextStyle(fontSize: 15, color: Colors.white),),
              ),
            ),
            Container(
              width: double.maxFinite,
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 110),
                      child: Image.asset("assets/images/landing_page_image2.png", height: 320,width: 320,),
                  ),
                  Image.asset("assets/images/landing_page_image1.png", height: 190,width: 190,),
                ],
              ),
            ),
          ],
        ),
      ), //   <-- image
    );
  }

  @override
  void initState() {
    super.initState();
    checkSignIn();
  }

  Future<void> checkSignIn() async {
    final prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey("islogin")){
      if(prefs.getBool("islogin")!){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmployeeMainScreen(employeeId: prefs.getString("employeeId")!, name: prefs.getString("name")!,)));
      }
    }
  }
}