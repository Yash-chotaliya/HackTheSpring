import 'package:flutter/material.dart';
import 'package:hack_the_spring/components/employee_salary.dart';
import 'package:hack_the_spring/data%20models/employee_model.dart';


class EmployeeSalaryScreen extends StatefulWidget{
  final List<EmployeeSalaryModel> employeeSalaryList;

  const EmployeeSalaryScreen({
    super.key,
    required this.employeeSalaryList
  });

  @override
  State<EmployeeSalaryScreen> createState() => _EmployeeSalaryScreenState();
}

class _EmployeeSalaryScreenState extends State<EmployeeSalaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
          decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/init_page_background.png"),
              )
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  color: Color(0xFF9b51e0),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50))
              ),
              padding: EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Icon(Icons.keyboard_backspace,size: 25, color: Colors.white,),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                  Text("Salary", style: TextStyle(color: Colors.white, fontSize: 25),),
                  SizedBox(width: 25,)
                ],
              ),
            ),
            Container(
              height: 550,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: widget.employeeSalaryList.length,
                itemBuilder: (context, index) {
                  return listItemLay3(context,index);
                },
              ),
            ),
            const SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }

  Widget listItemLay3(BuildContext context,int index){
    return EmployeeSalaryMainCard(employeeSalaryModel: widget.employeeSalaryList[index]);
  }
}