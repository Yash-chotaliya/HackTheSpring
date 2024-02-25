import 'package:flutter/cupertino.dart';

class EmployeeDashboardScreen extends StatefulWidget{
  const EmployeeDashboardScreen({super.key});

  @override
  State<EmployeeDashboardScreen> createState() => _EmployeeDashboardScreenState();
}

class _EmployeeDashboardScreenState extends State<EmployeeDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Dashboard"),
    );
  }
}