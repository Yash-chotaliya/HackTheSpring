import 'package:flutter/material.dart';
import 'package:hack_the_spring/employer/employer_expense/employer_expense_expanded_screen.dart';

import '../data models/employer_model.dart';

class EmployerExpenseCard extends StatelessWidget{
  final EmployerExpenseModel employerExpenseModel;

  const EmployerExpenseCard({
    super.key,
    required this.employerExpenseModel
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> EmployerExpenseExpandedScreen(employerExpenseModel: employerExpenseModel,)));
      },
      child: SizedBox(
        width: 350,
        child: Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 170,
                        alignment: Alignment.topCenter,
                        child: Image.asset("assets/images/expense_photo.png"),
                      ),
                      Container(
                        height: 200,
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Id: ${employerExpenseModel.employeeId}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                            EmployerExpenseText(hint: "Date", text: employerExpenseModel.time, icon: const Icon(Icons.calendar_today)),
                            EmployerExpenseText(hint: "Amount", text: employerExpenseModel.amount.toString(), icon: const Icon(Icons.currency_rupee)),
                            EmployerExpenseText(hint: "Vehicle Number", text: employerExpenseModel.vehicleNumber, icon: const Icon(Icons.motorcycle_sharp)),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 30),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: statusColor(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(employerExpenseModel.status, style: const TextStyle(color: Colors.white, fontSize: 12),),
                      ),
                      Container(
                          width: 160,
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.black,
                                      width: 1
                                  )
                              )
                          ),
                          margin: const EdgeInsets.only(left: 35),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Purpose", style: TextStyle(fontSize: 12)),
                              Text(employerExpenseModel.purpose, style: const TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          )
                      )
                    ],
                  )
                ],
              )
          ),
        ),
      ),
    );
  }

  statusColor() {
    if(employerExpenseModel.status=="Accepted") {
      return Colors.green;
    }
    return Colors.red;
  }
}

class EmployerExpenseText extends StatelessWidget{
  final String hint;
  final String text;
  final Widget icon;

  const EmployerExpenseText({
    super.key,
    required this.hint,
    required this.text,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Colors.black,
                  width: 1
              )
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(hint, style: const TextStyle(fontSize: 12),),
          const SizedBox(height: 3,),
          Row(
            children: [
              icon,
              const SizedBox(width: 5,),
              Text(text, style: const TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
          const SizedBox(height: 2,)
        ],
      ),
    );
  }

}

