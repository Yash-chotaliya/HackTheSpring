import 'package:flutter/material.dart';
import 'package:hack_the_spring/employer/add_employee/employer_add_employee_screen.dart';

class AddEmployeeScreen extends StatefulWidget{
  const AddEmployeeScreen({super.key});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/init_page_background.png")
          )
        ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  color: Color(0xFF3b72ff),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50))
              ),
              padding: const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        child: const Icon(Icons.keyboard_backspace,size: 25, color: Colors.white,),
                        onTap: (){
                          Navigator.pop(context);
                        },
                      ),
                      const Text("Employees", style: TextStyle(color: Colors.white, fontSize: 25),),
                      const SizedBox(width: 25,),
                    ],
                  ),
                  const SizedBox(height: 10), // Add some space between the "Employees" text and the search field
                  TextField( // Add your new search field here
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Search...',
                      hintStyle: const TextStyle(color: Colors.black),
                      prefixIcon: const Icon(Icons.search, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                    onChanged: (value) {
                      // Implement search functionality here
                    },

                  ),


                ],


              ),
            ),

          ],



        ),



      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF3b72ff),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const EmployerAddEmployeeScreen()));
        },
        child: const Icon(Icons.add, color: Colors.white,),
      ),);
 
  }




}


