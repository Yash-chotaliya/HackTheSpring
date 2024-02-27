import 'package:flutter/material.dart';
import '../data models/employee_model.dart';

class EmployeeAdvanceCard extends StatelessWidget{
  final EmployeeAdvanceModel employeeAdvanceModel;

  const EmployeeAdvanceCard({
    super.key,
    required this.employeeAdvanceModel
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                      child: Image.asset("assets/images/advance_icon.png"),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          EmployeeAdvanceText(hint: "Date", text: employeeAdvanceModel.issuedDate, icon: const Icon(Icons.calendar_today)),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                EmployeeAdvanceText(hint: "Amount", text: employeeAdvanceModel.amount.toString(), icon: const Icon(Icons.currency_rupee)),
                const SizedBox(height: 10,),
                Container(
                    width: double.maxFinite,
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
                        const Text("Purpose", style: TextStyle(fontSize: 12)),
                        Text(employeeAdvanceModel.purpose, style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    )
                )
              ],
            )
        ),
      ),
    );
  }
}

class EmployeeAdvanceText extends StatelessWidget{
  final String hint;
  final String text;
  final Widget icon;

  const EmployeeAdvanceText({
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