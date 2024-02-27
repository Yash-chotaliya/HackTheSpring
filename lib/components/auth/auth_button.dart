import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget{
  final Function()? onTap;
  final String btnTxt;

  const AuthButton({
    super.key,
    required this.onTap,
    required this.btnTxt
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
      child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF3b72ff)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                  )
              )
          ),
          child: Text(
              btnTxt,
            style: const TextStyle(color: Colors.white, fontSize: 17),
          )
      ),
    );
  }
}