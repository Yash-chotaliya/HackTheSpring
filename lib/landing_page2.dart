import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingPage2 extends StatelessWidget{
  const LandingPage2({super.key});

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
            Container(
                padding: const EdgeInsets.only(top: 80),
                child: const Text("Safe & Secure \nSalary \nManagement",style: TextStyle(color: Colors.white,fontSize: 27),textAlign: TextAlign.center, )
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 90),
                child: Image.asset("assets/images/landing_page_vector2.png")
            ),
            Container(
              width: 170,
              padding: const EdgeInsets.only(bottom: 100),
              child: TextButton(
                onPressed: (){

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: const Text("Get Started", style: TextStyle(fontSize: 15, color: Colors.black),),
              ),
            ),
          ],
        ),
      ), //   <-- image
    );
  }

}