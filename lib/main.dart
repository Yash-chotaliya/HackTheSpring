import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hack_the_spring/landing_page2.dart';

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

class LandingPage1 extends StatelessWidget{
  const LandingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/landing_page_background.png")
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Hello, I am your salary manager",style: TextStyle(color: Colors.white,fontSize: 25),textAlign: TextAlign.center),
            Image.asset("assets/images/landing_page_vector1.png"),
            SizedBox(
              width: 100,
              child: TextButton(
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (BuildContext context) => const LandingPage2(),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: const Text("Next", style: TextStyle(fontSize: 15, color: Colors.black),),
              ),
            ),
          ],
        ),
      ), //   <-- image
    );
  }

}