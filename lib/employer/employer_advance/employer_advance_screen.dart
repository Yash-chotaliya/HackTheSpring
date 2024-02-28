import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hack_the_spring/components/employer_advance.dart';

import '../../data models/employer_model.dart';
import 'employer_add_advance_screen.dart';

class EmployerAdvanceScreen extends StatefulWidget{
  const EmployerAdvanceScreen({super.key});

  @override
  State<EmployerAdvanceScreen> createState() => _EmployerAdvanceScreenState();
}

class _EmployerAdvanceScreenState extends State<EmployerAdvanceScreen> {

  List<EmployerAdvanceModel> employerAdvanceList =  [];

  @override
  void initState() {
    super.initState();
    getAdvances();
  }

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
           child: Column(
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
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     InkWell(
                       child: const Icon(Icons.keyboard_backspace,size: 25, color: Colors.white,),
                       onTap: (){
                         Navigator.pop(context);
                       },
                     ),
                     const Text("Advance", style: TextStyle(color: Colors.white, fontSize: 25),),
                     const SizedBox(width: 25,)
                   ],
                 ),
               ),
               Expanded(
                 child: ListView.builder(
                   scrollDirection: Axis.vertical,
                   itemCount: employerAdvanceList.length,
                   itemBuilder: (context, index) {
                     return listItemLay(context,index);
                   },
                 ),
               ),
             ],
           ),
         ),
         floatingActionButton: FloatingActionButton(
           backgroundColor: const Color(0xFF3b72ff),
           onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => const EmployerAddAdvanceScreen()));
           },
           child: const Icon(Icons.add, color: Colors.white,),
         ),
       );
  }

  Future<void> getAdvances() async {
    await FirebaseFirestore.instance.collection("Employer Advance").get().then((docSnapShot){
      for( var doc in docSnapShot.docs){
        setState(() {
          employerAdvanceList.insert(0, EmployerAdvanceModel(
              employeeId: doc.get("employeeId"),
              advanceId: doc.get("advanceId"),
              amount: doc.get("amount"),
              purpose: doc.get("purpose"),
              issuedDate: doc.get("issuedDate")
          ));
        });
      }
    });
  }

  Widget listItemLay(BuildContext context, int index) {
    return EmployerAdvanceCard(employerAdvanceModel: employerAdvanceList[index]);
  }
}