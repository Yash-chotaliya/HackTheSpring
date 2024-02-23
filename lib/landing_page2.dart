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
            const Text("Safe and Secure salary management",style: TextStyle(color: Colors.white,fontSize: 25),textAlign: TextAlign.center),
            Image.asset("assets/images/landing_page_vector2.png"),
            SizedBox(
              width: 200,
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