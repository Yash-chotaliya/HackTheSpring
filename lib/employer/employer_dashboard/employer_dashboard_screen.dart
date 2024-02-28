import 'package:flutter/cupertino.dart';

class EmployerDashboardScreen extends StatefulWidget{
  const EmployerDashboardScreen({super.key});

  @override
  State<EmployerDashboardScreen> createState() => _EmployerDashboardScreenState();
}

class _EmployerDashboardScreenState extends State<EmployerDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Dashboard"),
    );
  }
}