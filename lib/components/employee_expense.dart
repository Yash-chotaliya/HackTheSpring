import 'package:flutter/material.dart';
import 'package:hack_the_spring/data%20models/employee_model.dart';

class EmployeeExpenseCard extends StatelessWidget{
  final EmployeeExpenseModel employeeExpenseModel;

  const EmployeeExpenseCard({
    super.key,
    required this.employeeExpenseModel
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
            children: [
              Row(
                children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(employeeExpenseModel.photo, height: 170,width: 120,),
                  ),
                  Container(
                    height: 170,
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EmployeeExpenseText(hint: "Date", text: employeeExpenseModel.time, icon: const Icon(Icons.calendar_today)),
                        EmployeeExpenseText(hint: "Amount", text: employeeExpenseModel.amount.toString(), icon: const Icon(Icons.currency_rupee)),
                        EmployeeExpenseText(hint: "Vehicle Number", text: employeeExpenseModel.vehicleNumber, icon: const Icon(Icons.motorcycle_sharp)),
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
                    child: Text(employeeExpenseModel.status, style: const TextStyle(color: Colors.white, fontSize: 12),),
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
                          Text(employeeExpenseModel.purpose, style: const TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 10,),
                          if(employeeExpenseModel.status=="Rejected") const Text("Reason For Rejection", style: TextStyle(fontSize: 12)),
                          if(employeeExpenseModel.status=="Rejected") Text(employeeExpenseModel.rejectedReason, style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      )
                  )
                ],
              )
            ],
          )
        ),
      ),
    );
  }

  statusColor() {
    if(employeeExpenseModel.status=="Accepted") {
      return Colors.green;
    }
    return Colors.red;
  }
}

class EmployeeExpenseText extends StatelessWidget{
  final String hint;
  final String text;
  final Widget icon;

  const EmployeeExpenseText({
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

class EmployeeAddExpenseTextField extends StatelessWidget{
  final String hint;
  final TextEditingController controller;
  final TextInputType inputType;
  final Icon? prefixIcon;

  const EmployeeAddExpenseTextField({
    super.key,
    required this.hint,
    required this.controller,
    required this.inputType,
    required this.prefixIcon
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 10, bottom: 5),
          child: Text(hint, style: const TextStyle(color: Colors.white),),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            controller: controller,
            keyboardType: inputType,
            cursorColor: Colors.black,
            maxLines: null,
            style: TextStyle(fontSize: 18, color: Colors.black),
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
            ),
          ),
        )
      ],
    );
  }
}