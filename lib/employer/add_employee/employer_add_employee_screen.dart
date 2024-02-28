import 'package:flutter/material.dart';

class EmployerAddEmployeeScreen extends StatefulWidget{
  const EmployerAddEmployeeScreen({super.key});

  @override
  State<EmployerAddEmployeeScreen> createState() => _EmployerAddEmployeeScreenState();
}

class _EmployerAddEmployeeScreenState extends State<EmployerAddEmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
        image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage("assets/images/init_page_background.png")
    )
    ),
        ),
    );
  }
}