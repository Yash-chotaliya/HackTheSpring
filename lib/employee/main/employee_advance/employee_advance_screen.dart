import 'package:flutter/cupertino.dart';

class EmployeeAdvanceScreen extends StatefulWidget{
  const EmployeeAdvanceScreen({super.key});

  @override
  State<EmployeeAdvanceScreen> createState() => _EmployeeAdvanceScreenState();
}

class _EmployeeAdvanceScreenState extends State<EmployeeAdvanceScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Advance"),
    );
  }
}