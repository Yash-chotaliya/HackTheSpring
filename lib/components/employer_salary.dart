import 'package:flutter/material.dart';

import '../data models/employee_model.dart';

class EmployerSalaryCard extends StatelessWidget{
  final EmployeeDetailsModel employeeModel;

  const EmployerSalaryCard({
    super.key,
    required this.employeeModel
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
       // Navigator.push(context, MaterialPageRoute(builder:(context)=> EmployerEmployeeExpandedScreen(employeeDetailsModel: employeeDetailsModel,)));
      },
      child: Card(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Container(
              height: 50,
              width: 50,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Image.asset("assets/images/profile_image.png"),
            ),
            Expanded(
              child: Container(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(employeeModel.name),
                    Text(employeeModel.employeeId)
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 30),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: statusColor(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(employeeModel.salaryStatus, style: const TextStyle(color: Colors.white, fontSize: 12),),
            ),
          ],
        )
        ,

      ),
    );
  }

  statusColor() {
    if(employeeModel.salaryStatus=="Pending") {
      return Colors.red;
    }
    return Colors.green;
  }
}