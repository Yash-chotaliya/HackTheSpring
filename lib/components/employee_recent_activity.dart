import 'package:flutter/material.dart';
import 'package:hack_the_spring/data%20models/employee_model.dart';

class EmployeeRecentActivity extends StatefulWidget{
  final EmployeeRecentActivityModel employeeRecentActivityModel;

  const EmployeeRecentActivity({
    super.key,
    required this.employeeRecentActivityModel
  });

  @override
  State<EmployeeRecentActivity> createState() => _EmployeeRecentActivityState();
}

class _EmployeeRecentActivityState extends State<EmployeeRecentActivity> {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            child: Image.asset(getFeatureType()),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(widget.employeeRecentActivityModel.feature, style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                    SizedBox(width: 10,),
                    Text(widget.employeeRecentActivityModel.status, style: TextStyle(color: getStatusColor(), fontSize: 15),)
                  ],
                ),
                Text(widget.employeeRecentActivityModel.time, style: TextStyle(color: Colors.black, fontSize: 13),)
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getFeatureType() {
    if(widget.employeeRecentActivityModel.feature=="Expense"){
      return "assets/images/expense_icon.png";
    }
    return "assets/images/advance_icon.png";
  }

  Color getStatusColor(){
    if(widget.employeeRecentActivityModel.status=="Rejected"){
      return Colors.red;
    }
    else{
      return Colors.green;
    }
  }
}