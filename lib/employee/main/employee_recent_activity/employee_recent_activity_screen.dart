import 'package:flutter/material.dart';
import '../../../components/employee_recent_activity.dart';
import '../../../data models/employee_model.dart';

class EmployeeRecentActivityScreen extends StatefulWidget{
  final List<EmployeeRecentActivityModel> employeeRecentActivityList;

  const EmployeeRecentActivityScreen({
    super.key,
    required this.employeeRecentActivityList
  });

  @override
  State<EmployeeRecentActivityScreen> createState() => _EmployeeRecentActivityScreenState();
}

class _EmployeeRecentActivityScreenState extends State<EmployeeRecentActivityScreen> {
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
                  const Text("Recent Activity", style: TextStyle(color: Colors.white, fontSize: 25),),
                  const SizedBox(width: 25,)
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: widget.employeeRecentActivityList.length,
                itemBuilder: (context, index) {
                  return listItemLay(context,index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listItemLay(BuildContext context,int index){
    return EmployeeRecentActivity(employeeRecentActivityModel: widget.employeeRecentActivityList[index],);
  }
}