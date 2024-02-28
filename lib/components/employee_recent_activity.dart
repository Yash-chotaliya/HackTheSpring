import 'package:flutter/material.dart';
import 'package:hack_the_spring/data%20models/employee_model.dart';

class EmployeeRecentActivity extends StatelessWidget{
  final EmployeeRecentActivityModel employeeRecentActivityModel;

  const EmployeeRecentActivity({
    super.key,
    required this.employeeRecentActivityModel
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
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
                    Text(employeeRecentActivityModel.feature, style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                    SizedBox(width: 10,),
                    Text(employeeRecentActivityModel.status, style: TextStyle(color: Colors.blueAccent, fontSize: 15),)
                  ],
                ),
                Text(employeeRecentActivityModel.time, style: TextStyle(color: Colors.black, fontSize: 13),)
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getFeatureType() {
    if(employeeRecentActivityModel.feature=="Expense"){
      return "assets/images/expense_icon.png";
    }
    return "assets/images/advance_icon.png";
  }

}